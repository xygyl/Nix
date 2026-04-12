# alias check = fd -e flac -x nu -c '
#     let f = "{}";
#     let result = (^flac --test --silent $f | complete);
#     if $result.exit_code != 0 {
#         if ($result.stderr | str contains "cannot check MD5") {
#             # ignore
#         } else if ($result.stderr | str contains "MD5 signature mismatch") {
#             print $"MD5 MISMATCH: ($f)"
#         } else {
#             print $"DECODE ERROR: ($f)"
#             print $result.stderr
#         }
#     }
# '
# alias strip = fd -e flac -x nu -c '
#     let f = "{}";
#     let tmp = ($f + ".tmp.flac");
#     ^ffmpeg -v error -i $f -vn -c:a copy -map 0:a -map_metadata 0 -ignore_unknown $tmp;
#     if $env.LAST_EXIT_CODE == 0 {
#         mv $tmp $f;
#         ^id3v2 --delete-all $f
#     } else {
#         rm -f $tmp;
#         print ("Failed: " + $f)
#     }
# '

# alias fix = strip; check

# alias remove = fd -e flac -x nu -c '
#     let f = "{}";
#     let result = (^flac --test --silent $f | complete);
#     if $result.exit_code != 0 and not ($result.stderr | str contains "cannot check MD5") {
#         print $"Removing: ($f)";
#         rm $f
#     }
# '

def fw [
    --battery (-b): int
    --fan (-f): int
    --reset (-r)
] {
    if $reset {
        sudo su -c "framework_tool --autofanctrl"
        sudo su -c "framework_tool --charge-limit 80 o+e> /dev/null"
        print "Fan duty set to auto"
        print "Charge limit set to 80%"
        return
    }
    if ($battery == null and $fan == null) {
        print "Please supply arguments"
        return
    }
    if ($fan != null) {
        sudo su -c $"framework_tool --fansetduty ($fan)"
        print $"Fan duty set to ($fan)%"
    }
    if ($battery != null) {
        sudo su -c $"framework_tool --charge-limit ($battery) o+e> /dev/null"
        print $"Charge limit set to ($battery)%"
    }
}
def --env proton [] {
    cd ~/.steam/root/compatibilitytools.d
    protonup-rs -q
}
def psn [
    input: string
    --kill (-k)
] {
    let procs = ps | where name == $input
    if $kill {
        $procs | each { |p| kill $p.pid }
        null
    } else {
        $procs
    }
}
def ksteam [
    --exit (-e)
] {
    ps | where name == steam | last | kill $in.pid
    if $exit {
        exit
    }
}
def s [
    ...args: string
] {
    let cmd = ($args | str join ' ')
    job spawn { nu -c $cmd }
}

    ## Updating

def lvfs [] {
    fwupdmgr refresh --force
    fwupdmgr get-updates
    fwupdmgr update
}

    ## Critical files

alias nuc = hx ~/.config/nushell/config.nu

    ## Yazi cd functionality

def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}

source ./mod.nu
