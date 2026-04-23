{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gum
    vhs
    crush
    glow
    claude-code
    codex
    opencode
    aria2
    ascii-image-converter
    aspell
    aspellDicts.en
    astroterm
    bandwhich
    bat
    binsider
    brightnessctl
    btop-rocm
    cbonsai
    difftastic
    discordo
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
    radicle-tui
    ripgrep
    rmpc
    # rqbit
    scope-tui
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
