{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.awww.packages.${stdenv.hostPlatform.system}.awww
    # texliveFull

    wayback
    rhash
    cryptsetup
    blender
    brave
    calibre
    cava
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
    # ollama-rocm
    pavucontrol
    pkg-config
    poppler
    prismlauncher
    pwvucontrol
    qbittorrent
    syncthing
    thunderbird
    tor-browser
    typst
    # ungoogled-chromium
    unrar
    vesktop
    video-trimmer
    wev
    wl-clipboard
    wlsunset
    xwayland-satellite
    # zed-editor
  ];
}
