{
  programs.yazi.keymap.mgr.prepend_keymap = [
    { on = "M"; run = "plugin mount"; desc = "Mount drives"; }

    # trashing and deleting
    { on = "D"; run = "remove"; }
  	{ on = "d"; run = "remove --permanently"; }

    { on = [ "g" "c" ]; run = "plugin vcs-files"; desc = "Show git file changes"; }

    # toggle preview
    { on = "<C-t>"; run = "plugin toggle-pane min-preview"; }
    { on = "T"; run = "plugin toggle-pane max-preview"; }

    # file navigation wraparound  
    { on  = "k"; run = "plugin arrow -1"; }
    { on  = "j"; run = "plugin arrow 1"; }
    { on  = "<Up>"; run = "plugin arrow -1"; }
    { on  = "<Down>"; run = "plugin arrow 1"; }

    # parent directory navigation
    { on = "K"; run = "plugin parent-arrow -1"; }
    { on = "J"; run = "plugin parent-arrow 1"; }
    { on = "<S-Up>"; run = "plugin parent-arrow -1"; }
    { on = "<S-Down>"; run = "plugin parent-arrow 1"; }

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
