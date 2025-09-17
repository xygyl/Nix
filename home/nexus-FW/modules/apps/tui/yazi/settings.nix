{
  programs.yazi.settings = {
    mgr = {
      ratio          = [ 1 3 4 ];
      sort_by        = "natural";
      sort_dir_first = true;
      sort_reverse   = false;
    };
    preview = {
      image_delay   = 0;
      image_filter  = "nearest";
      image_quality = 50;
      max_height    = 5000;
      max_width     = 5000;
      tab_size      = 2;
      wrap          = "yes";
    };
    open.prepend_rules = [
    	{ name = "*.{gpg,asc}"; use = "decrypt"; }
    	{ name = "*.zst"; use = "extract_zstd"; }
    	{ name = "*.pdf"; use = "pdf"; }
    	{ name = "*.{png,jpg,gif,jfif,webp}"; use = "view"; }
    ];
    opener = {
      decrypt = [
        { run = ''gpg -o "$${1%.*}" -d "$1"''; }
      ];
      edit = [
        { run = ''hx "$@"''; block = true; }
      ];
      extract = [
        { run = ''ouch d -y "$@"''; }
      ];
      extract_zstd = [
        { run = ''zstd -d --long=31 "$@"''; }
      ];
      open = [
        { run = ''xdg-open "$@"''; }
      ];
      play = [
        { run = ''mpv --force-window=yes --loop "$@"''; orphan = true; }
      ];
      view = [
        { run = ''nomacs -f "$@"''; }
      ];
      pdf = [
        { run = ''zathura "$@"''; }
      ];
    };
    tasks = {
      image_alloc = 0;
      image_bound = [0 0];
    };
    plugin.prepend_fetchers = [
    	{ id = "git"; name = "*"; run = "git"; }
    	{ id = "git"; name = "*/"; run = "git"; }
    ];
  };
}
