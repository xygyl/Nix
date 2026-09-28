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
        { url = "*.{gpg,asc,age}"; fg = "#417BFF"; }
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
      	{ name = "Projects"; text = ""; }
      	{ name = "Public"; text = ""; }
      	{ name = "Ram"; text = ""; }
        { name = "Sync"; text = "󰴋"; }
      	{ name = "Videos"; text = ""; }
      ];
      exts = [
        { name = "age"; text = ""; }
        { name = "avi"; text = ""; }
        { name = "crate"; text = ""; }
        { name = "gpg"; text = ""; }
        { name = "kdl"; text = "󰄛"; }
        { name = "pug"; text = ""; }
      	{ name = "3gp"; text = ""; fg = "#fd971f"; }
      	{ name = "3mf"; text = "󰆧"; fg = "#888888"; }
      	{ name = "7z"; text = ""; fg = "#eca517"; }
      	{ name = "a"; text = ""; fg = "#dcddd6"; }
      	{ name = "aac"; text = ""; fg = "#00afff"; }
      	{ name = "ada"; text = ""; fg = "#599eff"; }
      	{ name = "adb"; text = ""; fg = "#599eff"; }
      	{ name = "ads"; text = ""; fg = "#a074c4"; }
      	{ name = "ai"; text = ""; fg = "#cbcb41"; }
      	{ name = "aif"; text = ""; fg = "#00afff"; }
      	{ name = "aiff"; text = ""; fg = "#00afff"; }
      	{ name = "android"; text = ""; fg = "#34a853"; }
      	{ name = "ape"; text = ""; fg = "#00afff"; }
      	{ name = "apk"; text = ""; fg = "#34a853"; }
      	{ name = "apl"; text = ""; fg = "#24a148"; }
      	{ name = "app"; text = ""; fg = "#9f0500"; }
      	{ name = "applescript"; text = ""; fg = "#6d8085"; }
      	{ name = "asc"; text = "󰦝"; fg = "#576d7f"; }
      	{ name = "asm"; text = ""; fg = "#0091bd"; }
      	{ name = "ass"; text = "󰨖"; fg = "#ffb713"; }
      	{ name = "astro"; text = ""; fg = "#e23f67"; }
      	{ name = "avif"; text = ""; fg = "#a074c4"; }
      	{ name = "awk"; text = ""; fg = "#4d5a5e"; }
      	{ name = "azcli"; text = ""; fg = "#0078d4"; }
      	{ name = "bak"; text = "󰁯"; fg = "#6d8086"; }
      	{ name = "bash"; text = ""; fg = "#89e051"; }
      	{ name = "bat"; text = ""; fg = "#c1f12e"; }
      	{ name = "bazel"; text = ""; fg = "#89e051"; }
      	{ name = "bib"; text = "󱉟"; fg = "#cbcb41"; }
      	{ name = "bicep"; text = ""; fg = "#519aba"; }
      	{ name = "bicepparam"; text = ""; fg = "#9f74b3"; }
      	{ name = "bin"; text = ""; fg = "#9f0500"; }
      	{ name = "blade.php"; text = ""; fg = "#f05340"; }
      	{ name = "blend"; text = "󰂫"; fg = "#ea7600"; }
      	{ name = "blp"; text = "󰺾"; fg = "#5796e2"; }
      	{ name = "bmp"; text = ""; fg = "#a074c4"; }
      	{ name = "bqn"; text = ""; fg = "#24a148"; }
      	{ name = "brep"; text = "󰻫"; fg = "#839463"; }
      	{ name = "bz"; text = ""; fg = "#eca517"; }
      	{ name = "bz2"; text = ""; fg = "#eca517"; }
      	{ name = "bz3"; text = ""; fg = "#eca517"; }
      	{ name = "bzl"; text = ""; fg = "#89e051"; }
      	{ name = "c"; text = ""; fg = "#599eff"; }
      	{ name = "c++"; text = ""; fg = "#f34b7d"; }
      	{ name = "cache"; text = ""; fg = "#ffffff"; }
      	{ name = "cast"; text = ""; fg = "#fd971f"; }
      	{ name = "cbl"; text = ""; fg = "#005ca5"; }
      	{ name = "cc"; text = ""; fg = "#f34b7d"; }
      	{ name = "ccm"; text = ""; fg = "#f34b7d"; }
      	{ name = "cfc"; text = ""; fg = "#01a4ba"; }
      	{ name = "cfg"; text = ""; fg = "#6d8086"; }
      	{ name = "cfm"; text = ""; fg = "#01a4ba"; }
      	{ name = "cjs"; text = ""; fg = "#cbcb41"; }
      	{ name = "clj"; text = ""; fg = "#8dc149"; }
      	{ name = "cljc"; text = ""; fg = "#8dc149"; }
      	{ name = "cljd"; text = ""; fg = "#519aba"; }
      	{ name = "cljs"; text = ""; fg = "#519aba"; }
      	{ name = "cmake"; text = ""; fg = "#dce3eb"; }
      	{ name = "cob"; text = ""; fg = "#005ca5"; }
      	{ name = "cobol"; text = ""; fg = "#005ca5"; }
      	{ name = "coffee"; text = ""; fg = "#cbcb41"; }
      	{ name = "conda"; text = ""; fg = "#43b02a"; }
      	{ name = "conf"; text = ""; fg = "#6d8086"; }
      	{ name = "config.ru"; text = ""; fg = "#701516"; }
      	{ name = "cow"; text = "󰆚"; fg = "#965824"; }
      	{ name = "cp"; text = ""; fg = "#519aba"; }
      	{ name = "cpp"; text = ""; fg = "#519aba"; }
      	{ name = "cppm"; text = ""; fg = "#519aba"; }
      	{ name = "cpy"; text = ""; fg = "#005ca5"; }
      	{ name = "cr"; text = ""; fg = "#c8c8c8"; }
      	{ name = "crdownload"; text = ""; fg = "#44cda8"; }
      	{ name = "cs"; text = "󰌛"; fg = "#596706"; }
      	{ name = "csh"; text = ""; fg = "#4d5a5e"; }
      	{ name = "cshtml"; text = "󱦗"; fg = "#512bd4"; }
      	{ name = "cson"; text = ""; fg = "#cbcb41"; }
      	{ name = "csproj"; text = "󰪮"; fg = "#512bd4"; }
      	{ name = "css"; text = ""; fg = "#663399"; }
      	{ name = "csv"; text = ""; fg = "#89e051"; }
      	{ name = "cts"; text = ""; fg = "#519aba"; }
      	{ name = "cu"; text = ""; fg = "#89e051"; }
      	{ name = "cue"; text = "󰲹"; fg = "#ed95ae"; }
      	{ name = "cuh"; text = ""; fg = "#a074c4"; }
      	{ name = "cxx"; text = ""; fg = "#519aba"; }
      	{ name = "cxxm"; text = ""; fg = "#519aba"; }
      	{ name = "d"; text = ""; fg = "#b03931"; }
      	{ name = "d.ts"; text = ""; fg = "#d59855"; }
      	{ name = "dart"; text = ""; fg = "#03589c"; }
      	{ name = "db"; text = ""; fg = "#dad8d8"; }
      	{ name = "dconf"; text = ""; fg = "#ffffff"; }
      	{ name = "desktop"; text = ""; fg = "#563d7c"; }
      	{ name = "diff"; text = ""; fg = "#41535b"; }
      	{ name = "dll"; text = ""; fg = "#4d2c0b"; }
      	{ name = "doc"; text = "󰈬"; fg = "#185abd"; }
      	{ name = "Dockerfile"; text = "󰡨"; fg = "#458ee6"; }
      	{ name = "dockerignore"; text = "󰡨"; fg = "#458ee6"; }
      	{ name = "docx"; text = "󰈬"; fg = "#185abd"; }
      	{ name = "dot"; text = "󱁉"; fg = "#30638e"; }
      	{ name = "download"; text = ""; fg = "#44cda8"; }
      	{ name = "drl"; text = ""; fg = "#ffafaf"; }
      	{ name = "dropbox"; text = ""; fg = "#0061fe"; }
      	{ name = "dump"; text = ""; fg = "#dad8d8"; }
      	{ name = "dwg"; text = "󰻫"; fg = "#839463"; }
      	{ name = "dxf"; text = "󰻫"; fg = "#839463"; }
      	{ name = "ebook"; text = ""; fg = "#eab16d"; }
      	{ name = "ebuild"; text = ""; fg = "#4c416e"; }
      	{ name = "edn"; text = ""; fg = "#519aba"; }
      	{ name = "eex"; text = ""; fg = "#a074c4"; }
      	{ name = "ejs"; text = ""; fg = "#cbcb41"; }
      	{ name = "el"; text = ""; fg = "#8172be"; }
      	{ name = "elc"; text = ""; fg = "#8172be"; }
      	{ name = "elf"; text = ""; fg = "#9f0500"; }
      	{ name = "elm"; text = ""; fg = "#519aba"; }
      	{ name = "eln"; text = ""; fg = "#8172be"; }
      	{ name = "env"; text = ""; fg = "#faf743"; }
      	{ name = "eot"; text = ""; fg = "#ececec"; }
      	{ name = "epp"; text = ""; fg = "#ffa61a"; }
      	{ name = "epub"; text = ""; fg = "#eab16d"; }
      	{ name = "erb"; text = ""; fg = "#701516"; }
      	{ name = "erl"; text = ""; fg = "#b83998"; }
      	{ name = "ex"; text = ""; fg = "#a074c4"; }
      	{ name = "exe"; text = ""; fg = "#9f0500"; }
      	{ name = "exs"; text = ""; fg = "#a074c4"; }
      	{ name = "f#"; text = ""; fg = "#519aba"; }
      	{ name = "f3d"; text = "󰻫"; fg = "#839463"; }
      	{ name = "f90"; text = "󱈚"; fg = "#734f96"; }
      	{ name = "fbx"; text = "󰆧"; fg = "#888888"; }
      	{ name = "fcbak"; text = ""; fg = "#cb333b"; }
      	{ name = "fcmacro"; text = ""; fg = "#cb333b"; }
      	{ name = "fcmat"; text = ""; fg = "#cb333b"; }
      	{ name = "fcparam"; text = ""; fg = "#cb333b"; }
      	{ name = "fcscript"; text = ""; fg = "#cb333b"; }
      	{ name = "fcstd"; text = ""; fg = "#cb333b"; }
      	{ name = "fcstd1"; text = ""; fg = "#cb333b"; }
      	{ name = "fctb"; text = ""; fg = "#cb333b"; }
      	{ name = "fctl"; text = ""; fg = "#cb333b"; }
      	{ name = "fdmdownload"; text = ""; fg = "#44cda8"; }
      	{ name = "feature"; text = ""; fg = "#00a818"; }
      	{ name = "fish"; text = ""; fg = "#4d5a5e"; }
      	{ name = "flac"; text = ""; fg = "#0075aa"; }
      	{ name = "flc"; text = ""; fg = "#ececec"; }
      	{ name = "flf"; text = ""; fg = "#ececec"; }
      	{ name = "fnl"; text = ""; fg = "#fff3d7"; }
      	{ name = "fodg"; text = ""; fg = "#fffb57"; }
      	{ name = "fodp"; text = ""; fg = "#fe9c45"; }
      	{ name = "fods"; text = ""; fg = "#78fc4e"; }
      	{ name = "fodt"; text = ""; fg = "#2dcbfd"; }
      	{ name = "frag"; text = ""; fg = "#5586a6"; }
      	{ name = "fs"; text = ""; fg = "#519aba"; }
      	{ name = "fsi"; text = ""; fg = "#519aba"; }
      	{ name = "fsscript"; text = ""; fg = "#519aba"; }
      	{ name = "fsx"; text = ""; fg = "#519aba"; }
      	{ name = "gcode"; text = "󰐫"; fg = "#1471ad"; }
      	{ name = "gd"; text = ""; fg = "#6d8086"; }
      	{ name = "gemspec"; text = ""; fg = "#701516"; }
      	{ name = "geom"; text = ""; fg = "#5586a6"; }
      	{ name = "gif"; text = ""; fg = "#a074c4"; }
      	{ name = "git"; text = ""; fg = "#f14c28"; }
      	{ name = "glb"; text = ""; fg = "#ffb13b"; }
      	{ name = "gleam"; text = ""; fg = "#ffaff3"; }
      	{ name = "glsl"; text = ""; fg = "#5586a6"; }
      	{ name = "gnumakefile"; text = ""; fg = "#6d8086"; }
      	{ name = "go"; text = ""; fg = "#00add8"; }
      	{ name = "godot"; text = ""; fg = "#6d8086"; }
      	{ name = "gpr"; text = ""; fg = "#6d8086"; }
      	{ name = "gql"; text = ""; fg = "#e535ab"; }
      	{ name = "gradle"; text = ""; fg = "#005f87"; }
      	{ name = "graphql"; text = ""; fg = "#e535ab"; }
      	{ name = "gresource"; text = ""; fg = "#ffffff"; }
      	{ name = "gv"; text = "󱁉"; fg = "#30638e"; }
      	{ name = "gz"; text = ""; fg = "#eca517"; }
      	{ name = "h"; text = ""; fg = "#a074c4"; }
      	{ name = "haml"; text = ""; fg = "#eaeae1"; }
      	{ name = "hbs"; text = ""; fg = "#f0772b"; }
      	{ name = "heex"; text = ""; fg = "#a074c4"; }
      	{ name = "hex"; text = ""; fg = "#2e63ff"; }
      	{ name = "hh"; text = ""; fg = "#a074c4"; }
      	{ name = "hpp"; text = ""; fg = "#a074c4"; }
      	{ name = "hrl"; text = ""; fg = "#b83998"; }
      	{ name = "hs"; text = ""; fg = "#a074c4"; }
      	{ name = "htm"; text = ""; fg = "#e34c26"; }
      	{ name = "html"; text = ""; fg = "#e44d26"; }
      	{ name = "http"; text = ""; fg = "#008ec7"; }
      	{ name = "huff"; text = "󰡘"; fg = "#4242c7"; }
      	{ name = "hurl"; text = ""; fg = "#ff0288"; }
      	{ name = "hx"; text = ""; fg = "#ea8220"; }
      	{ name = "hxx"; text = ""; fg = "#a074c4"; }
      	{ name = "ical"; text = ""; fg = "#2b2e83"; }
      	{ name = "icalendar"; text = ""; fg = "#2b2e83"; }
      	{ name = "ico"; text = ""; fg = "#cbcb41"; }
      	{ name = "ics"; text = ""; fg = "#2b2e83"; }
      	{ name = "ifb"; text = ""; fg = "#2b2e83"; }
      	{ name = "ifc"; text = "󰻫"; fg = "#839463"; }
      	{ name = "ige"; text = "󰻫"; fg = "#839463"; }
      	{ name = "iges"; text = "󰻫"; fg = "#839463"; }
      	{ name = "igs"; text = "󰻫"; fg = "#839463"; }
      	{ name = "image"; text = ""; fg = "#d0bec8"; }
      	{ name = "img"; text = ""; fg = "#d0bec8"; }
      	{ name = "import"; text = ""; fg = "#ececec"; }
      	{ name = "info"; text = ""; fg = "#ffffcd"; }
      	{ name = "ini"; text = ""; fg = "#6d8086"; }
      	{ name = "ino"; text = ""; fg = "#56b6c2"; }
      	{ name = "ipynb"; text = ""; fg = "#f57d01"; }
      	{ name = "iso"; text = ""; fg = "#d0bec8"; }
      	{ name = "ixx"; text = ""; fg = "#519aba"; }
      	{ name = "jar"; text = ""; fg = "#ffaf67"; }
      	{ name = "java"; text = ""; fg = "#cc3e44"; }
      	{ name = "jl"; text = ""; fg = "#a270ba"; }
      	{ name = "jpeg"; text = ""; fg = "#a074c4"; }
      	{ name = "jpg"; text = ""; fg = "#a074c4"; }
      	{ name = "js"; text = ""; fg = "#cbcb41"; }
      	{ name = "json"; text = ""; fg = "#cbcb41"; }
      	{ name = "json5"; text = ""; fg = "#cbcb41"; }
      	{ name = "jsonc"; text = ""; fg = "#cbcb41"; }
      	{ name = "jsx"; text = ""; fg = "#20c2e3"; }
      	{ name = "jwmrc"; text = ""; fg = "#0078cd"; }
      	{ name = "jxl"; text = ""; fg = "#a074c4"; }
      	{ name = "kbx"; text = "󰯄"; fg = "#737672"; }
      	{ name = "kdb"; text = ""; fg = "#529b34"; }
      	{ name = "kdbx"; text = ""; fg = "#529b34"; }
      	{ name = "kdenlive"; text = ""; fg = "#83b8f2"; }
      	{ name = "kdenlivetitle"; text = ""; fg = "#83b8f2"; }
      	{ name = "kicad_dru"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_mod"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_pcb"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_prl"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_pro"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_sch"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_sym"; text = ""; fg = "#ffffff"; }
      	{ name = "kicad_wks"; text = ""; fg = "#ffffff"; }
      	{ name = "ko"; text = ""; fg = "#dcddd6"; }
      	{ name = "kpp"; text = ""; fg = "#f245fb"; }
      	{ name = "kra"; text = ""; fg = "#f245fb"; }
      	{ name = "krz"; text = ""; fg = "#f245fb"; }
      	{ name = "ksh"; text = ""; fg = "#4d5a5e"; }
      	{ name = "kt"; text = ""; fg = "#7f52ff"; }
      	{ name = "kts"; text = ""; fg = "#7f52ff"; }
      	{ name = "lck"; text = ""; fg = "#bbbbbb"; }
      	{ name = "leex"; text = ""; fg = "#a074c4"; }
      	{ name = "less"; text = ""; fg = "#563d7c"; }
      	{ name = "lff"; text = ""; fg = "#ececec"; }
      	{ name = "lhs"; text = ""; fg = "#a074c4"; }
      	{ name = "lib"; text = ""; fg = "#4d2c0b"; }
      	{ name = "license"; text = ""; fg = "#cbcb41"; }
      	{ name = "liquid"; text = ""; fg = "#95bf47"; }
      	{ name = "lock"; text = ""; fg = "#bbbbbb"; }
      	{ name = "log"; text = "󰌱"; fg = "#dddddd"; }
      	{ name = "lrc"; text = "󰨖"; fg = "#ffb713"; }
      	{ name = "lua"; text = ""; fg = "#51a0cf"; }
      	{ name = "luac"; text = ""; fg = "#51a0cf"; }
      	{ name = "luau"; text = ""; fg = "#00a2ff"; }
      	{ name = "m"; text = ""; fg = "#599eff"; }
      	{ name = "m3u"; text = "󰲹"; fg = "#ed95ae"; }
      	{ name = "m3u8"; text = "󰲹"; fg = "#ed95ae"; }
      	{ name = "m4a"; text = ""; fg = "#00afff"; }
      	{ name = "m4v"; text = ""; fg = "#fd971f"; }
      	{ name = "magnet"; text = ""; fg = "#a51b16"; }
      	{ name = "makefile"; text = ""; fg = "#6d8086"; }
      	{ name = "markdown"; text = ""; fg = "#dddddd"; }
      	{ name = "material"; text = ""; fg = "#b83998"; }
      	{ name = "md"; text = ""; fg = "#dddddd"; }
      	{ name = "md5"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "mdx"; text = ""; fg = "#519aba"; }
      	{ name = "mint"; text = "󰌪"; fg = "#87c095"; }
      	{ name = "mjs"; text = ""; fg = "#f1e05a"; }
      	{ name = "mk"; text = ""; fg = "#6d8086"; }
      	{ name = "mkv"; text = ""; fg = "#fd971f"; }
      	{ name = "ml"; text = ""; fg = "#e37933"; }
      	{ name = "mli"; text = ""; fg = "#e37933"; }
      	{ name = "mm"; text = ""; fg = "#519aba"; }
      	{ name = "mo"; text = ""; fg = "#9772fb"; }
      	{ name = "mobi"; text = ""; fg = "#eab16d"; }
      	{ name = "mojo"; text = ""; fg = "#ff4c1f"; }
      	{ name = "mov"; text = ""; fg = "#fd971f"; }
      	{ name = "mp3"; text = ""; fg = "#00afff"; }
      	{ name = "mp4"; text = ""; fg = "#fd971f"; }
      	{ name = "mpp"; text = ""; fg = "#519aba"; }
      	{ name = "msf"; text = ""; fg = "#137be1"; }
      	{ name = "mts"; text = ""; fg = "#519aba"; }
      	{ name = "mustache"; text = ""; fg = "#e37933"; }
      	{ name = "nfo"; text = ""; fg = "#ffffcd"; }
      	{ name = "nim"; text = ""; fg = "#f3d400"; }
      	{ name = "nix"; text = ""; fg = "#7ebae4"; }
      	{ name = "norg"; text = ""; fg = "#4878be"; }
      	{ name = "nswag"; text = ""; fg = "#85ea2d"; }
      	{ name = "nu"; text = ""; fg = "#3aa675"; }
      	{ name = "o"; text = ""; fg = "#9f0500"; }
      	{ name = "obj"; text = "󰆧"; fg = "#888888"; }
      	{ name = "odf"; text = ""; fg = "#ff5a96"; }
      	{ name = "odg"; text = ""; fg = "#fffb57"; }
      	{ name = "odin"; text = "󰟢"; fg = "#3882d2"; }
      	{ name = "odp"; text = ""; fg = "#fe9c45"; }
      	{ name = "ods"; text = ""; fg = "#78fc4e"; }
      	{ name = "odt"; text = ""; fg = "#2dcbfd"; }
      	{ name = "oga"; text = ""; fg = "#0075aa"; }
      	{ name = "ogg"; text = ""; fg = "#0075aa"; }
      	{ name = "ogv"; text = ""; fg = "#fd971f"; }
      	{ name = "ogx"; text = ""; fg = "#fd971f"; }
      	{ name = "opus"; text = ""; fg = "#0075aa"; }
      	{ name = "org"; text = ""; fg = "#77aa99"; }
      	{ name = "otf"; text = ""; fg = "#ececec"; }
      	{ name = "out"; text = ""; fg = "#9f0500"; }
      	{ name = "part"; text = ""; fg = "#44cda8"; }
      	{ name = "patch"; text = ""; fg = "#41535b"; }
      	{ name = "pck"; text = ""; fg = "#6d8086"; }
      	{ name = "pcm"; text = ""; fg = "#0075aa"; }
      	{ name = "pdf"; text = ""; fg = "#b30b00"; }
      	{ name = "php"; text = ""; fg = "#a074c4"; }
      	{ name = "pl"; text = ""; fg = "#519aba"; }
      	{ name = "pls"; text = "󰲹"; fg = "#ed95ae"; }
      	{ name = "ply"; text = "󰆧"; fg = "#888888"; }
      	{ name = "pm"; text = ""; fg = "#519aba"; }
      	{ name = "png"; text = ""; fg = "#a074c4"; }
      	{ name = "po"; text = ""; fg = "#2596be"; }
      	{ name = "pot"; text = ""; fg = "#2596be"; }
      	{ name = "pp"; text = ""; fg = "#ffa61a"; }
      	{ name = "ppt"; text = "󰈧"; fg = "#cb4a32"; }
      	{ name = "pptx"; text = "󰈧"; fg = "#cb4a32"; }
      	{ name = "prisma"; text = ""; fg = "#5a67d8"; }
      	{ name = "pro"; text = ""; fg = "#e4b854"; }
      	{ name = "ps1"; text = "󰨊"; fg = "#4273ca"; }
      	{ name = "psb"; text = ""; fg = "#519aba"; }
      	{ name = "psd"; text = ""; fg = "#519aba"; }
      	{ name = "psd1"; text = "󰨊"; fg = "#6975c4"; }
      	{ name = "psm1"; text = "󰨊"; fg = "#6975c4"; }
      	{ name = "pub"; text = "󰷖"; fg = "#e3c58e"; }
      	{ name = "pxd"; text = ""; fg = "#5aa7e4"; }
      	{ name = "pxi"; text = ""; fg = "#5aa7e4"; }
      	{ name = "py"; text = ""; fg = "#ffbc03"; }
      	{ name = "pyc"; text = ""; fg = "#ffe291"; }
      	{ name = "pyd"; text = ""; fg = "#ffe291"; }
      	{ name = "pyi"; text = ""; fg = "#ffbc03"; }
      	{ name = "pyo"; text = ""; fg = "#ffe291"; }
      	{ name = "pyw"; text = ""; fg = "#5aa7e4"; }
      	{ name = "pyx"; text = ""; fg = "#5aa7e4"; }
      	{ name = "qm"; text = ""; fg = "#2596be"; }
      	{ name = "qml"; text = ""; fg = "#40cd52"; }
      	{ name = "qrc"; text = ""; fg = "#40cd52"; }
      	{ name = "qss"; text = ""; fg = "#40cd52"; }
      	{ name = "query"; text = ""; fg = "#90a850"; }
      	{ name = "R"; text = "󰟔"; fg = "#2266ba"; }
      	{ name = "r"; text = "󰟔"; fg = "#2266ba"; }
      	{ name = "rake"; text = ""; fg = "#701516"; }
      	{ name = "rar"; text = ""; fg = "#eca517"; }
      	{ name = "rasi"; text = ""; fg = "#cbcb41"; }
      	{ name = "razor"; text = "󱦘"; fg = "#512bd4"; }
      	{ name = "rb"; text = ""; fg = "#701516"; }
      	{ name = "res"; text = ""; fg = "#cc3e44"; }
      	{ name = "resi"; text = ""; fg = "#f55385"; }
      	{ name = "rlib"; text = ""; fg = "#dea584"; }
      	{ name = "rmd"; text = ""; fg = "#519aba"; }
      	{ name = "rproj"; text = "󰗆"; fg = "#358a5b"; }
      	{ name = "rs"; text = ""; fg = "#dea584"; }
      	{ name = "rss"; text = ""; fg = "#fb9d3b"; }
      	{ name = "s"; text = ""; fg = "#0071c5"; }
      	{ name = "sass"; text = ""; fg = "#f55385"; }
      	{ name = "sbt"; text = ""; fg = "#cc3e44"; }
      	{ name = "sc"; text = ""; fg = "#cc3e44"; }
      	{ name = "scad"; text = ""; fg = "#f9d72c"; }
      	{ name = "scala"; text = ""; fg = "#cc3e44"; }
      	{ name = "scm"; text = "󰘧"; fg = "#eeeeee"; }
      	{ name = "scss"; text = ""; fg = "#f55385"; }
      	{ name = "sh"; text = ""; fg = "#4d5a5e"; }
      	{ name = "sha1"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "sha224"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "sha256"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "sha384"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "sha512"; text = "󰕥"; fg = "#8c86af"; }
      	{ name = "sig"; text = "󰘧"; fg = "#e37933"; }
      	{ name = "signature"; text = "󰘧"; fg = "#e37933"; }
      	{ name = "skp"; text = "󰻫"; fg = "#839463"; }
      	{ name = "sldasm"; text = "󰻫"; fg = "#839463"; }
      	{ name = "sldprt"; text = "󰻫"; fg = "#839463"; }
      	{ name = "slim"; text = ""; fg = "#e34c26"; }
      	{ name = "sln"; text = ""; fg = "#854cc7"; }
      	{ name = "slnx"; text = ""; fg = "#854cc7"; }
      	{ name = "slvs"; text = "󰻫"; fg = "#839463"; }
      	{ name = "sml"; text = "󰘧"; fg = "#e37933"; }
      	{ name = "so"; text = ""; fg = "#dcddd6"; }
      	{ name = "sol"; text = ""; fg = "#519aba"; }
      	{ name = "spec.js"; text = ""; fg = "#cbcb41"; }
      	{ name = "spec.jsx"; text = ""; fg = "#20c2e3"; }
      	{ name = "spec.ts"; text = ""; fg = "#519aba"; }
      	{ name = "spec.tsx"; text = ""; fg = "#1354bf"; }
      	{ name = "spx"; text = ""; fg = "#0075aa"; }
      	{ name = "sql"; text = ""; fg = "#dad8d8"; }
      	{ name = "sqlite"; text = ""; fg = "#dad8d8"; }
      	{ name = "sqlite3"; text = ""; fg = "#dad8d8"; }
      	{ name = "srt"; text = "󰨖"; fg = "#ffb713"; }
      	{ name = "ssa"; text = "󰨖"; fg = "#ffb713"; }
      	{ name = "ste"; text = "󰻫"; fg = "#839463"; }
      	{ name = "step"; text = "󰻫"; fg = "#839463"; }
      	{ name = "stl"; text = "󰆧"; fg = "#888888"; }
      	{ name = "stories.js"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.jsx"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.mjs"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.svelte"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.ts"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.tsx"; text = ""; fg = "#ff4785"; }
      	{ name = "stories.vue"; text = ""; fg = "#ff4785"; }
      	{ name = "stp"; text = "󰻫"; fg = "#839463"; }
      	{ name = "strings"; text = ""; fg = "#2596be"; }
      	{ name = "styl"; text = ""; fg = "#8dc149"; }
      	{ name = "sub"; text = "󰨖"; fg = "#ffb713"; }
      	{ name = "sublime"; text = ""; fg = "#e37933"; }
      	{ name = "suo"; text = ""; fg = "#854cc7"; }
      	{ name = "sv"; text = "󰍛"; fg = "#019833"; }
      	{ name = "svelte"; text = ""; fg = "#ff3e00"; }
      	{ name = "svg"; text = "󰜡"; fg = "#ffb13b"; }
      	{ name = "svgz"; text = "󰜡"; fg = "#ffb13b"; }
      	{ name = "svh"; text = "󰍛"; fg = "#019833"; }
      	{ name = "swift"; text = ""; fg = "#e37933"; }
      	{ name = "t"; text = ""; fg = "#519aba"; }
      	{ name = "tbc"; text = "󰛓"; fg = "#1e5cb3"; }
      	{ name = "tcl"; text = "󰛓"; fg = "#1e5cb3"; }
      	{ name = "templ"; text = ""; fg = "#dbbd30"; }
      	{ name = "terminal"; text = ""; fg = "#31b53e"; }
      	{ name = "test.js"; text = ""; fg = "#cbcb41"; }
      	{ name = "test.jsx"; text = ""; fg = "#20c2e3"; }
      	{ name = "test.ts"; text = ""; fg = "#519aba"; }
      	{ name = "test.tsx"; text = ""; fg = "#1354bf"; }
      	{ name = "tex"; text = ""; fg = "#3d6117"; }
      	{ name = "tf"; text = ""; fg = "#5f43e9"; }
      	{ name = "tfvars"; text = ""; fg = "#5f43e9"; }
      	{ name = "tgz"; text = ""; fg = "#eca517"; }
      	{ name = "tmpl"; text = ""; fg = "#dbbd30"; }
      	{ name = "tmux"; text = ""; fg = "#14ba19"; }
      	{ name = "toml"; text = ""; fg = "#9c4221"; }
      	{ name = "torrent"; text = ""; fg = "#44cda8"; }
      	{ name = "tres"; text = ""; fg = "#6d8086"; }
      	{ name = "ts"; text = ""; fg = "#519aba"; }
      	{ name = "tscn"; text = ""; fg = "#6d8086"; }
      	{ name = "tsconfig"; text = ""; fg = "#ff8700"; }
      	{ name = "tsx"; text = ""; fg = "#1354bf"; }
      	{ name = "ttf"; text = ""; fg = "#ececec"; }
      	{ name = "twig"; text = ""; fg = "#8dc149"; }
      	{ name = "txt"; text = "󰈙"; fg = "#89e051"; }
      	{ name = "txz"; text = ""; fg = "#eca517"; }
      	{ name = "typ"; text = ""; fg = "#0dbcc0"; }
      	{ name = "typoscript"; text = ""; fg = "#ff8700"; }
      	{ name = "ui"; text = ""; fg = "#015bf0"; }
      	{ name = "v"; text = "󰍛"; fg = "#019833"; }
      	{ name = "vala"; text = ""; fg = "#7b3db9"; }
      	{ name = "vert"; text = ""; fg = "#5586a6"; }
      	{ name = "vh"; text = "󰍛"; fg = "#019833"; }
      	{ name = "vhd"; text = "󰍛"; fg = "#019833"; }
      	{ name = "vhdl"; text = "󰍛"; fg = "#019833"; }
      	{ name = "vi"; text = ""; fg = "#fec60a"; }
      	{ name = "vim"; text = ""; fg = "#019833"; }
      	{ name = "vsh"; text = ""; fg = "#5d87bf"; }
      	{ name = "vsix"; text = ""; fg = "#854cc7"; }
      	{ name = "vue"; text = ""; fg = "#8dc149"; }
      	{ name = "wasm"; text = ""; fg = "#5c4cdb"; }
      	{ name = "wav"; text = ""; fg = "#00afff"; }
      	{ name = "webm"; text = ""; fg = "#fd971f"; }
      	{ name = "webmanifest"; text = ""; fg = "#f1e05a"; }
      	{ name = "webp"; text = ""; fg = "#a074c4"; }
      	{ name = "webpack"; text = "󰜫"; fg = "#519aba"; }
      	{ name = "wma"; text = ""; fg = "#00afff"; }
      	{ name = "wmv"; text = ""; fg = "#fd971f"; }
      	{ name = "woff"; text = ""; fg = "#ececec"; }
      	{ name = "woff2"; text = ""; fg = "#ececec"; }
      	{ name = "wrl"; text = "󰆧"; fg = "#888888"; }
      	{ name = "wrz"; text = "󰆧"; fg = "#888888"; }
      	{ name = "wv"; text = ""; fg = "#00afff"; }
      	{ name = "wvc"; text = ""; fg = "#00afff"; }
      	{ name = "x"; text = ""; fg = "#599eff"; }
      	{ name = "xaml"; text = "󰙳"; fg = "#512bd4"; }
      	{ name = "xcf"; text = ""; fg = "#635b46"; }
      	{ name = "xcplayground"; text = ""; fg = "#e37933"; }
      	{ name = "xcstrings"; text = ""; fg = "#2596be"; }
      	{ name = "xls"; text = "󰈛"; fg = "#207245"; }
      	{ name = "xlsx"; text = "󰈛"; fg = "#207245"; }
      	{ name = "xm"; text = ""; fg = "#519aba"; }
      	{ name = "xml"; text = "󰗀"; fg = "#e37933"; }
      	{ name = "xpi"; text = ""; fg = "#ff1b01"; }
      	{ name = "xslt"; text = "󰗀"; fg = "#33a9dc"; }
      	{ name = "xul"; text = ""; fg = "#e37933"; }
      	{ name = "xz"; text = ""; fg = "#eca517"; }
      	{ name = "yaml"; text = ""; fg = "#6d8086"; }
      	{ name = "yml"; text = ""; fg = "#6d8086"; }
      	{ name = "zig"; text = ""; fg = "#f69a1b"; }
      	{ name = "zip"; text = ""; fg = "#eca517"; }
      	{ name = "zsh"; text = ""; fg = "#89e051"; }
      	{ name = "zst"; text = ""; fg = "#eca517"; }
      	{ name = "🔥"; text = ""; fg = "#ff4c1f"; }
      ];
    };
  };
}
