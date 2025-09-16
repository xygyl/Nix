{
  programs.yazi.keymap.mgr.prepend_keymap = [
    { on = "M"; run = "plugin mount"; desc = "Mount drives"; }

    # trashing and deleting
    { on = "D"; run = "remove"; }
  	{ on = "d"; run = "remove --permanently"; }

    { on = [ "g" "r" ]; run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"''; desc = "Go to root of git repo"; }
    { on = [ "g" "c" ]; run = "plugin vcs-files"; desc = "Show git file changes"; }

    # toggle preview
    { on = "<C-t>"; run = "plugin toggle-pane min-preview"; }
    { on = "T"; run = "plugin toggle-pane max-preview"; }

    # creating files and directories
    { on = "a"; run = "create --force"; }
    { on = "A"; run = "create --dir --force"; }

    { on = "P"; run = "plugin smart-paste"; desc = "Paste into the hovered directory"; }

    { on = ["c" "m"]; run = "plugin chmod"; desc = "Chmod on selected files`"; }

    { on = "F"; run = "plugin smart-filter"; desc = "Smart filter"; }

    { on = "z"; run = "plugin zoxide"; }
    { on = "Z"; run = "plugin fzf"; }
  ];
}
