alias r  = rsync -ah --delete --inplace --no-whole-file --info=progress2
alias rv = rsync -avh --delete --inplace --no-whole-file --info=progress2
def back [] {
    rv /home/xygyl/Sync/backups/ /home/xygyl/Archive2/backups/
    rv /home/xygyl/Sync/backups/ /home/xygyl/Archive3/backups/
    rv /home/xygyl/Sync/personal/ /home/xygyl/Archive2/personal/
    rv /home/xygyl/Sync/personal/ /home/xygyl/Archive3/personal/
    rv /home/xygyl/Archive2/porn/ /home/xygyl/Archive3/porn/
    rv /home/xygyl/Archive2/Music/ /home/xygyl/Archive3/Music/
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
