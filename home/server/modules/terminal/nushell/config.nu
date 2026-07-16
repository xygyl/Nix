def bniri [] {
    cd ~/Documents/niri/ 
    jj git fetch
    nix develop -c cargo b --release
    cd
    ./Documents/niri/target/release/niri
}

def psn [
    input: string
    --kill (-k)
] {
    let procs = ps | where name == $input
    if $kill {
        $procs | each { |p| kill $p.pid }
        null
    } else {
        $procs
    }
}

def s [
    ...args: string
] {
    let cmd = ($args | str join " ")
    job spawn { nu -c $cmd }
}

source ./mod.nu
