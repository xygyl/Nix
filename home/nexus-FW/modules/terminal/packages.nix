{ pkgs, ... }:

{
  home.packages = with pkgs; [
    sqlit-tui
    crush
    glow
    gum
    pop
    skate
    soft-serve
    vhs
    wishlist
    claude-code
    codex
    scope-tui
    discordo
    binsider
    radicle-tui
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
    eza
    fd
    fend
    fzf
    git
    git-filter-repo
    gitui
    gping
    hw-probe
    # iamb
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
    weechat
    wf-recorder
    wget
    wgetpaste
    wthrr
    yt-dlp
    zip
  ];
}
