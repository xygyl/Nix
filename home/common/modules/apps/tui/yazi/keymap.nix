{
  programs.yazi.keymap.mgr.prepend_keymap = [
    { on = "M"; run = "plugin mount"; desc = "Mount drives"; }
    { on = "<S-Up>"; run = "plugin parent-arrow -1"; }
    { on = "<S-Down>"; run = "plugin parent-arrow 1"; }
    { on = "D"; run = "remove"; }
    { on = "d"; run = "remove --permanently"; }
    { on = [ "," "M" ]; run = [ "sort mtime --reverse=no" "linemode mtime" ]; }
    { on = [ "," "m" ]; run = [ "sort mtime --reverse=yes" "linemode mtime" ]; }
    { on = [ "," "S" ]; run = [ "sort size --reverse=no" "linemode size" ]; }
    { on = [ "," "s" ]; run = [ "sort size --reverse=yes" "linemode size" ]; }
    { on = [ "g" "c" ]; run = "plugin vcs-files"; desc = "Show git file changes"; }
    { on = [ "g" "p" ]; run = "cd ~/Ram"; desc = "Go to tmpfs"; }
    {
      on = [ "g" "r" ];
      run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"'';
      desc = "Go to root of git repo";
    }
    { on = "<C-t>"; run = "plugin toggle-pane min-preview"; }
    { on = "T"; run = "plugin toggle-pane max-preview"; }
    { on = "a"; run = "create --force"; }
    { on = "A"; run = "create --dir --force"; }
    { on = "P"; run = "plugin smart-paste"; desc = "Paste into the hovered directory"; }
    { on = ["c" "m"]; run = "plugin chmod"; desc = "Chmod on selected files`"; }
    { on = "F"; run = "plugin smart-filter"; desc = "Smart filter"; }
    { on = "z"; run = "plugin zoxide"; }
    { on = "Z"; run = "plugin fzf"; }
  ];
}
