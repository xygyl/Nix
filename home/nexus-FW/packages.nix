{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # texliveFull

    ab-av1
    blender
    brave
    calibre
    cava
    cryptsetup
    # element
    ffmpeg-full
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
    sunsetr
    syncthing
    termscp
    thunderbird
    tor-browser
    typst
    # ungoogled-chromium
    unrar
    vesktop
    video-trimmer
    wev
    wiki-tui
    wl-clipboard
    xwayland-satellite
    # zed-editor
  ];
}
