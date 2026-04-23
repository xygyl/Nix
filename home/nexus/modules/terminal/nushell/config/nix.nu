def --env ns [
    --conf (-c)
    --home (-h)
    --sys (-s)
    --update (-u)
] {
    if $conf {
        let nix_dir = $"/home/($env.USER)/Nix"
        if not ($env.PWD | str starts-with $nix_dir) {
            cd $nix_dir
        }
    }
    match [$home $sys $update] {
        [true true true] | [false false true] => {
            nh home switch ~/Nix -u
            nh os switch ~/Nix -u
        }
        [true true false] | [false false false] => {
            nh home switch ~/Nix
            nh os switch ~/Nix
        }
        [true false true] => {
            nh home switch ~/Nix -u
        }
        [true false false] => {
            nh home switch ~/Nix
        }
        [false true true] => {
            nh os switch ~/Nix -u
        }
        [false true false] => {
            nh os switch ~/Nix
        }
    }
}

def nhs [
    --limit (-l): int
    input: string
] {
    nh search -l ($limit | default 5) $input
}

def --env conf [] {
    cd ~/Nix
    y
}

def --env pack [] {
    cd ~/Nix/
    let file = gum choose home term lang helix games system
    match $file {
        "home" => { hx "./home/nexus-FW/packages.nix" }
        "term" => { hx "./home/nexus-FW/modules/terminal/packages.nix" }
        "lang" => { hx "./home/nexus-FW/modules/terminal/language-tools/packages.nix" }
        "helix" => { hx "./home/nexus-FW/modules/apps/tui/helix/packages.nix" }
        "games" => { hx "./home/nexus-FW/modules/apps/games/packages.nix" }
        "system" => { hx "./hosts/nexus-FW/system/packages.nix" }
        _ => {}
    }
    clear
}
