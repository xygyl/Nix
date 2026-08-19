{
  programs.yazi.settings = {
    mgr = {
      ratio          = [ 1 3 4 ];
      sort_by        = "natural";
      sort_dir_first = true;
      sort_reverse   = false;
    };
    preview = {
      image_delay    = 0;
      image_filter   = "nearest";
      image_protocol = "kitty";
      image_quality  = 50;
      max_height     = 2000;
      max_width      = 2000;
      tab_size       = 1;
      wrap           = "yes";
    };
    open.prepend_rules = [
    	{ url = "*.{gpg,asc}"; use = "decrypt"; }
    	{ url = "*.zst"; use = "extract_zstd"; }
    	{ url = "*.pdf"; use = "pdf"; }
    	{ url = "*.{cbr,cbz}"; use = "comic"; }
    	{ url = "*.{png,jpg,gif,jfif,webp}"; use = "view"; }
    ];
    opener = {
      decrypt      = [ { run = ''f=%s; gpg -o "$${f%.*}" -d "$f"''; } ];
      edit         = [ { run = "hx %s"; block = true; } ];
      extract      = [ { run = "ouch d -y %s"; } ];
      extract_zstd = [ { run = "zstd -d --long=31 %s"; } ];
      open         = [ { run = "xdg-open %s"; } ];
      play         = [ { run = "mpv --force-window=yes --loop %s"; orphan = true; } ];
      # view         = [ { run = "mcomix -f %s"; } ];
      view         = [ { run = "nomacs -f %s"; } ];
      comic        = [ { run = "mcomix -fd %s"; } ];
      pdf          = [ { run = "firefox %s"; } ];
    };
    tasks = {
      image_alloc = 0;
      image_bound = [0 0];
    };
    plugin.prepend_fetchers = [
    	{ id = "git"; url = "*"; run = "git"; group = "git"; }
    	{ id = "git"; url = "*/"; run = "git"; group = "git"; }
    ];
  };
}
