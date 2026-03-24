{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aria2
    ascii-image-converter
    aspell
    aspellDicts.en
    astroterm
    bandwhich
    bat
    brightnessctl
    btop-rocm
    cbonsai
    difftastic
    dua
    dysk
    # eza
    fd
    fend
    fzf
    git
    git-filter-repo
    gitui
    gping
    hw-probe
    # iamb
    jujutsu
    kalker
    keepass-diff
    macchina
    neovim
    ouch
    pastel
    pipes-rs
    pngcheck
    pngcrush
    protonup-rs
    ripgrep
    rmpc
    # rqbit
    sd
    # speedtest-cli
    tokei
    unzip
    # vhs
    weechat
    wf-recorder
    wget
    wgetpaste
    wthrr
    yt-dlp
    zip
  ];
}
