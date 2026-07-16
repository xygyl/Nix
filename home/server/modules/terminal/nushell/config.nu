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
