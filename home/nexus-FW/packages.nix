{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # floorp-bin
    cava
    ffmpeg
    firefox
    gimp
    gnome-themes-extra
    gnupg
    kdePackages.kdenlive
    kdePackages.neochat
    keepassxc
    krita
    libratbag
    libreoffice
    mpd
    mpv
    networkmanagerapplet
    nicotine-plus
  	niri
    nomacs
    nwg-look
    obs-studio
    pavucontrol
    piper
    pkg-config
    poppler
    prismlauncher
    qbittorrent
    stockfish
    swww
    syncthing
    thunderbird
    tor-browser
    typst
    unrar-free
    vesktop
    video-trimmer
    wev
    wl-clipboard
    wlsunset
    xwayland-satellite
    zathura
  ];
}
