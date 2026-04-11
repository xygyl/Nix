{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.awww.packages.${stdenv.hostPlatform.system}.awww
    opus-tools
    # fluffychat
    # element
    # appimage-run
    # stoat-desktop
    # deno
    blender
    brave
    # cachix
    calibre
    cava
    ffmpeg
    firefox
    flac
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
    llama-cpp-rocm
    pavucontrol
    # pdftk
    # piper
    pkg-config
    poppler
    prismlauncher
    pwvucontrol
    qbittorrent
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
