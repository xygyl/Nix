{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.awww.packages.${stdenv.hostPlatform.system}.awww
    # appimage-run
    blender
    brave
    # cachix
    calibre
    cava
    # deno
    # element
    ffmpeg
    firefox
    flac
    # fluffychat
    gamescope
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
    llama-cpp-rocm
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
    opus-tools
    pavucontrol
    # pdftk
    # piper
    pkg-config
    poppler
    prismlauncher
    pwvucontrol
    qbittorrent
    # stoat-desktop
    stockfish
    syncthing
    # teehee
    thunderbird
    tor-browser
    typst
    typst-live
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
