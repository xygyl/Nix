def nirib [] {
    cd ~/Documents/niri/ 
    jj git fetch
    nix develop -c cargo b --release
    cd
    ./Documents/niri/target/release/niri
}

def fw [
    --battery (-b): int
    --fan (-f): int
    --reset (-r)
] {
    if $reset {
        sudo su -c "framework_tool --autofanctrl"
        sudo su -c "framework_tool --charge-limit 80 o+e> /dev/null"
        print "Fan duty set to auto"
        print "Charge limit set to 80%"
        return
    }
    if ($battery == null and $fan == null) {
        print "Please supply arguments"
        return
    }
    if ($fan != null) {
        sudo su -c $"framework_tool --fansetduty ($fan)"
        print $"Fan duty set to ($fan)%"
    }
    if ($battery != null) {
        sudo su -c $"framework_tool --charge-limit ($battery) o+e> /dev/null"
        print $"Charge limit set to ($battery)%"
    }
}

def --env proton [] {
    cd ~/.steam/root/compatibilitytools.d
    protonup-rs -q
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

def ksteam [
    --exit (-e)
] {
    ps | where name == steam | last | kill $in.pid
    if $exit {
        exit
    }
}

def s [
    ...args: string
] {
    let cmd = ($args | str join ' ')
    job spawn { nu -c $cmd }
}

    ## Updating

def lvfs [] {
    fwupdmgr refresh --force
    fwupdmgr get-updates
    fwupdmgr update
}

    ## Critical files

alias nuc = hx ~/.config/nushell/config.nu

source ./mod.nu
