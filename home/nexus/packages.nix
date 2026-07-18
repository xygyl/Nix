{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # texliveFull

    awww
    blender
    brave
    calibre
    cava
    cryptsetup
    discord
    # element
    ffmpeg
    firefox
    flac
    gamescope
    gimp
    git-lfs
    gnome-themes-extra
    # gnupg
    instaloader
    # jre_minimal
    keepassxc
    # kid3
    krita
    libreoffice
    # llama-cpp-rocm
    # mcomix
    mpd
    networkmanagerapplet
    nicotine-plus
    niri
    nomacs
    nwg-look
    obs-studio
    # ollama-rocm
    pavucontrol
    pkg-config
    poppler
    prismlauncher
    pwvucontrol
    qbittorrent
    rhash
    smartmontools
    sunsetr
    syncthing
    thunderbird
    tor-browser
    typst
    # ungoogled-chromium
    unrar
    vesktop
    video-trimmer
    vital
    wev
    wl-clipboard
    xwayland-satellite
    # zed-editor
  ];
}
