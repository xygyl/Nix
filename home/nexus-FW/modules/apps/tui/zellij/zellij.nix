{
  programs.zellij = {
    enable = true;
    settings = {
      keybinds = {
        clear-defaults = true;
        _props."clear-defaults" = true;
        locked.children = [
          {
            bind = { _args = [ "Ctrl g" ]; _children = [
                { SwitchToMode._args = [ "normal" ]; }
              ];
            };
          }
        ];
        pane.children = [
          { bind = { _args = [ "left" ]; MoveFocus._args = [ "left" ]; }; }
          { bind = { _args = [ "down" ]; MoveFocus._args = [ "down" ]; }; }
          { bind = { _args = [ "up" ]; MoveFocus._args = [ "up" ]; }; }
          { bind = { _args = [ "right" ]; MoveFocus._args = [ "right" ]; }; }
          { bind = { _args = [ "c" ]; SwitchToMode._args = [ "renamepane" ]; PaneNameInput._args = [ 0 ]; }; }
          { bind = { _args = [ "d" ]; NewPane._args = [ "down" ]; SwitchToMode._args = [ "normal" ];}; }
        ];
      };
    };
  };
}
