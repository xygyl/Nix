{ pkgs, ...}:

{
  programs.yazi.plugins = with pkgs; {
    "chmod" = yaziPlugins.chmod;
    "full-border" = yaziPlugins.full-border;
    "git" = yaziPlugins.git;
    "mount" = yaziPlugins.mount;
    "smart-enter" = yaziPlugins.smart-enter;
    "smart-filter" = yaziPlugins.smart-filter;
    "smart-paste" = yaziPlugins.smart-paste;
    "toggle-pane" = yaziPlugins.toggle-pane;
    "vcs-files" = yaziPlugins.vcs-files;
  };
}
