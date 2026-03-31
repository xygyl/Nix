{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.awww.packages.${stdenv.hostPlatform.system}.awww
    # fluffychat
    # element
    # appimage-run
    # stoat-desktop
    # deno
    blender
    brave
    binsider
    # cachix
    calibre
    cava
    # chatgpt-cli
    claude-code
    discordo
    ffmpeg
    firefox
    flac
    # gamescope
    gimp
    git-lfs
    gnome-themes-extra
    gnupg
    # hexyl
    instaloader
    jre_minimal
    keepassxc
    # kid3
    krita
    # libratbag
    libreoffice
    # mcomix
    mpd
    mpv
    networkmanagerapplet
    nicotine-plus
    niri
    nomacs
    nwg-look
    obs-studio
    ollama-rocm
    pavucontrol
    # pdftk
    # piper
    pkg-config
    poppler
    prismlauncher
    pwvucontrol
    qbittorrent
    radicle-tui
    # scope-tui
    stockfish
    syncthing
    # teehee
    thunderbird
    tor-browser
    typst
    # typstPackages.syntree
    # ungoogled-chromium
    unrar
    vesktop
    video-trimmer
    wev
    wl-clipboard
    wlsunset
    xwayland-satellite
    # zathura
    zed-editor
  ];
}
