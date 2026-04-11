{
  programs.yazi.theme = {
    mgr = {
      cwd             = { fg = "#00FFAA"; };
      hovered         = { fg = "#00EAFF"; bold = true; italic = true; };
      preview_hovered = {};
      find_keyword    = { fg = "#F1FF5D"; bold = true; reversed = true; };
      find_position   = { fg = "#AE5DFF"; bg = "reset"; bold = true; };
      marker_copied   = { fg = "#00FFAA"; };
      marker_cut      = { fg = "#FF006A"; };
      marker_marked   = { fg = "#00EAFF"; };
      marker_selected = { fg = "#F1FF5D"; };
      tab_active      = { fg = "#00FFAA"; bg = "black";reversed = true; };
      tab_inactive    = {};
      tab_width       = 20;
      count_copied    = { fg = "black"; bg = "#00FFAA"; };
      count_cut       = { fg = "black"; bg = "#FF006A"; };
      count_selected  = { fg = "black"; bg = "#F1FF5D"; };
      border_style    = { fg = "#312A50"; };
    };
    tabs = {
      active          = { fg = "#00FFAA"; bg = "black"; };
      inactive        = { fg = "#DDE1FF"; bg = "black"; };
      sep_inner       = { open = ""; close = ""; };
      sep_outer       = { open = ""; close = ""; };
    };
    mode = {
      normal_main     = { bg = "#00FFAA"; fg = "black"; bold = true; };
      select_main     = { bg = "#00EAFF"; fg = "black"; bold = true; };
      unset_main      = { bg = "#FF006A"; fg = "black"; bold = true; };
      normal_alt      = { fg = "#00FFAA"; bg = "black"; bold = true; };
      select_alt      = { fg = "#00EAFF"; bg = "black"; bold = true; };
      unset_alt       = { fg = "#FF006A"; bg = "black"; bold = true; };
    };
    status = {
      separator_open  = "";
      separator_close = "";
      separator_style = { fg = "black"; bg = "black"; };
      progress_label  = { bold = true; };
      progress_normal = { fg = "black"; bg = "#00EAFF"; };
      progress_error  = { fg = "black"; bg = "#FF006A"; };
      permissions_t   = { fg = "#00FFAA"; };
      permissions_r   = { fg = "#F1FF5D"; };
      permissions_w   = { fg = "#FF006A"; };
      permissions_x   = { fg = "#00EAFF"; };
      permissions_s   = { fg = "#312A50"; };
    };
    pick = {
      border          = { fg = "#007fff"; };
      active          = { fg = "#BF00FF"; bold = true; };
      inactive        = {};
    };
    input = {
      border          = { fg = "#007fff"; };
      title           = {};
      value           = {};
      selected        = { reversed = true; };
    };
    completion = {
      border          = { fg = "#007fff"; };
      active          = { reversed = true; };
      inactive        = {};

      icon_file       = "";
      icon_folder     = "";
      icon_command    = "";
    };
    tasks = {
      border          = { fg = "#007fff"; };
      title           = {};
      hovered         = { fg = "#BF00FF"; underline = true; };
    };
    help = {
      on              = { fg = "#6B5DFF"; };
      run             = { fg = "#00EAFF"; };
      desc            = { fg = "#00FFAA"; };
      hovered         = { bold = true; italic = true; reversed = true; };
      footer          = { fg = "#F1FF5D"; bg = "black"; bold = true; italic = true; };
    };
    filetype = {
      rules = [
        # images
        { mime = "image/*"; fg = "#F1FF5D"; }
        # media
        { mime = "{audio,video}/*"; fg = "#F98771"; }
        # documents
        { mime = "application/{pdf,doc,rtf,vnd.*}"; fg = "#FF5D85"; }
        # archives
        { mime = "application/{,g}zip"; fg = "#F971CD"; }
        { mime = "application/{tar,bzip*,7z-compressed,xz,rar}"; fg = "#F971CD"; }
        { mime = "application/{zstd}"; fg = "#F971CD"; }
        # encryption
        { url = "*.{gpg,asc}"; fg = "#417BFF"; }
        # fallback
        { url = "*/"; fg = "#6B5DFF"; }
        { url = "*"; fg = "#DDE1FF"; }
      ];
    };
    icon = {
      dirs  = [
      	{ name = ".config"; text = ""; }
      	{ name = "Desktop"; text = ""; }
      	{ name = "Development"; text = ""; }
      	{ name = "Documents"; text = ""; }
      	{ name = "Downloads"; text = ""; }
      	{ name = ".github"; text = ""; }
      	{ name = ".git"; text = ""; }
        { name = "KeePassXC"; text = ""; }
      	{ name = "Library"; text = ""; }
      	{ name = "monero"; text = ""; }
      	{ name = "Movies"; text = ""; }
      	{ name = "Music"; text = ""; }
        { name = "nix"; text = "󱄅"; }
      	{ name = ".npm"; text = ""; }
      	{ name = "Pictures"; text = ""; }
      	{ name = "Public"; text = ""; }
      	{ name = "Ram"; text = ""; }
        { name = "Sync"; text = "󰴋"; }
      	{ name = "Videos"; text = ""; }
      ];
      exts = [
        # misc filetypes
        { name = "crate"; text = ""; }
        { name = "kdbx"; text = ""; }
        { name = "lock"; text = ""; }
        { name = "pdf"; text = ""; }
        { name = "txt"; text = ""; }
        # code
        { name = "cpp"; text = ""; }
        { name = "css"; text = ""; }
        { name = "cs"; text = ""; }
        { name = "c"; text = ""; }
        { name = "ejs"; text = ""; }
        { name = "go"; text = ""; }
        { name = "hs"; text = ""; }
        { name = "html"; text = ""; }
        { name = "java"; text = ""; }
        { name = "json"; text = ""; }
        { name = "js"; text = ""; }
        { name = "kdl"; text = "󰄛"; }
        { name = "lua"; text = ""; }
        { name = "nix"; text = "󱄅"; }
        { name = "pug"; text = ""; }
        { name = "py"; text = ""; }
        { name = "rs"; text = "󱘗"; }
        { name = "toml"; text = ""; }
        { name = "ts"; text = ""; }
        { name = "typ"; text = ""; }
        { name = "yaml"; text = "󰰳"; }
        # database
        { name = "sql"; text = ""; }
        # images
        { name = "gif"; text = "󰵸"; }
        { name = "jpg"; text = "󰈥"; }
        { name = "png"; text = "󰸭"; }
        # videos
        { name = "avi"; text = ""; }
        { name = "m4v"; text = ""; }
        { name = "mkv"; text = ""; }
        { name = "mp4"; text = ""; }
        # archives
        { name = "7z"; text = ""; }
        { name = "br"; text = ""; }
        { name = "bz2"; text = ""; }
        { name = "bz3"; text = ""; }
        { name = "bz"; text = ""; }
        { name = "gz"; text = ""; }
        { name = "lz4"; text = ""; }
        { name = "lzma"; text = ""; }
        { name = "rar"; text = ""; }
        { name = "sz"; text = ""; }
        { name = "tar"; text = "󱛟"; }
        { name = "xz"; text = ""; }
        { name = "zip"; text = ""; }
        { name = "zpaq"; text = ""; }
        { name = "zst"; text = ""; }
        # encryption
        { name = "asc"; text = "󰳍"; }
        { name = "gpg"; text = ""; }
      ];
    };
  };
}
