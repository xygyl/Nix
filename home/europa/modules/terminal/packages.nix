{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # sqlit-tui
    # lazysql

    glow
    gum
    vhs

    claude-code
    # codex
    # opencode

    age
    aria2
    ascii-image-converter
    aspell
    aspellDicts.en
    astroterm
    bandwhich
    bat
    # binsider
    brightnessctl
    btop-rocm
    cbonsai
    difftastic
    # discordo
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
    # hw-probe
    hyperfine
    # iamb
    kalker
    # keepass-diff
    macchina
    neovim
    openssl
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
    # scope-tui
    sd
    # speedtest-cli
    tokei
    unzip
    # weathr
    weechat
    # wf-recorder
    wget
    wgetpaste
    wthrr
    yt-dlp
    zip
  ];
}
