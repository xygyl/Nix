{ config, pkgs, ... }:

{
  home.username = "xygyl";
  home.homeDirectory = "/home/xygyl";

  home.stateVersion = "24.05";

  # User packages
  home.packages = with pkgs; [
    aria2
    ascii-image-converter
    aspell
    aspellDicts.en
    astroterm
    atuin
    bandwhich
    bat
    bottom
    brightnessctl
    cargo
    cava
    cbonsai
    chess-tui
    clang
    clang-tools
    clippy
    croc
    difftastic
    dua
    dysk
    eza
    fd
    fend
    ffmpeg
    firefox
    fuzzel
    fzf
    gimp
    git
    gitui
    gnome-themes-extra
    gnupg
    gping
    helix
    jjui 
    jujutsu
    just
    kalker
    kdePackages.kdenlive
    kdlfmt
    keepass-diff
    keepassxc
    kitty
    krita
    libratbag
    libreoffice
    macchina
    mpd
    mpv
    neovim
    networkmanagerapplet
    nh
    nicotine-plus
    nil
  	niri
    nomacs
    nushell
    nwg-look
    obs-studio
    ouch
    pastel
    pavucontrol
    piper
    pipes-rs
    pkg-config
    pngcheck
    pngcrush
    poppler
    prismlauncher
    protonup
    qbittorrent
    rio
    ripgrep
    rmpc
    rqbit
    ruff
    rust-analyzer
    rustc
    rustfmt
    rustlings
    sd
    speedtest-cli
    spotify-player
    starship
    stockfish
    swww
    syncthing
    thunderbird
    tinymist
    tokei
    typst
    unrar-free
    vesktop
    video-trimmer
    vscode-css-languageserver
    waybar
    weechat
    wev
    wf-recorder
    wget
    wgetpaste
    wireguard-tools
    wl-clipboard
    wlsunset
    wthrr
    xwayland-satellite
    yazi
    yt-dlp
    zoxide
    flatpak
    tor-browser
    zip
    unzip
    zathura
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.git = {
    enable = true;
    userName = "xygyl";
    userEmail = "xygyl@proton.me";
  };

  programs.home-manager.enable = true;
}
