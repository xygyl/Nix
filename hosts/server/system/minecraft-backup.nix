{ pkgs, ... }:

let
  serverName = "mc";
  service = "minecraft-server-${serverName}.service";
  stdin = "/run/minecraft/${serverName}.stdin";
  backupDir = "/var/backups/minecraft";
in

{
  systemd.tmpfiles.rules = [
    "d ${backupDir} 0750 minecraft minecraft -"
  ];

  systemd.services.minecraft-backup = {
    description = "Back up the Minecraft world";
    path = [ pkgs.rsync pkgs.systemd pkgs.findutils pkgs.coreutils ];
    script = ''
      set -euo pipefail

      active=false
      name="${serverName}-world-$(date +%Y-%m-%d_%H%M%S)"
      tmpDir="${backupDir}/$name.tmp"
      finalDir="${backupDir}/$name"

      # No matter how this script exits (success, error, or being killed by
      # systemd's start timeout), always re-enable autosave if we turned it
      # off, and clean up a partial snapshot so it never gets counted as one
      # of the 2 retained backups. Re-check is-active: if the server died
      # mid-backup, the FIFO has no reader and "echo > fifo" would block on
      # open() for the full TimeoutStartSec; skipping the write is also
      # correct in that case, since a stopped server needs no save-on.
      trap '
        rm -rf "$tmpDir"
        if [ "$active" = true ] && systemctl is-active --quiet ${service}; then
          echo "save-on" > ${stdin} || true
        fi
      ' EXIT

      if systemctl is-active --quiet ${service}; then
        active=true
        echo "save-off" > ${stdin}
        echo "save-all flush" > ${stdin}
        # give the server a few seconds to finish flushing to disk
        sleep 10
      fi

      # Hard-link against the most recent complete snapshot (if any) so
      # unchanged files cost zero additional disk writes -- only files that
      # actually changed since the last backup get physically copied. Only
      # match directories (not the old .tar.gz/.tar.zst files from the
      # previous backup implementation) and never a leftover ".tmp".
      prev=$(find ${backupDir} -maxdepth 1 -mindepth 1 -type d \
               -name "${serverName}-world-*" ! -name "*.tmp" \
               -printf '%f\n' | sort -r | head -n1)

      if [ -n "$prev" ]; then
        rsync -a --delete --link-dest="${backupDir}/$prev" /srv/minecraft/${serverName}/world/ "$tmpDir/"
      else
        rsync -a /srv/minecraft/${serverName}/world/ "$tmpDir/"
      fi

      mv "$tmpDir" "$finalDir"

      # keep only the 2 most recent backups. rm -rf on an older snapshot is
      # safe even though it shares hard-linked files with newer ones --
      # removing a link just drops that directory's reference; files still
      # referenced by a surviving snapshot are untouched.
      cd ${backupDir}
      find . -maxdepth 1 -mindepth 1 -type d -name "${serverName}-world-*" ! -name "*.tmp" \
        -printf '%f\n' | sort -r | tail -n +3 | xargs -r rm -rf --
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "minecraft";
      Group = "minecraft";
      # Default systemd start timeout on this machine is 90s. Give real
      # headroom so a slow run (e.g. the very first, fully non-incremental
      # one) is never killed mid-write, which would corrupt the snapshot
      # and, worse, could leave autosave disabled if killed before save-on.
      TimeoutStartSec = "30m";
    };
  };

  systemd.timers.minecraft-backup = {
    description = "Minecraft world backup every hour";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      # OnBootSec anchors to actual kernel boot time, which is wrong on a
      # machine that stays up for days between `nixos-rebuild switch` runs
      # (its target ends up in the past and never fires). OnActiveSec
      # anchors to when this timer unit itself is activated instead, which
      # is always "just now" - correct regardless of real system uptime.
      OnActiveSec = "1h";
      OnUnitActiveSec = "1h";
      Persistent = true;
    };
  };
}
