{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
    '';
  };
}
