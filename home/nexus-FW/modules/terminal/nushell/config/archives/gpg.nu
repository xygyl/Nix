def cgpg [
    ...inputs: string
    --armor (-a)
    --keep (-k)
    --symmetric (-c)
] {
    for $input in $inputs {
        mut flags = if $symmetric {
            ['-c' '--no-symkey-cache' '--cipher-algo' 'AES256']
        } else {
            ['-esr' 'anon' '-z0']
        }
        if $armor { $flags = ($flags | prepend '-a') }
        gpg ...$flags $input
        if (not $keep) { rm $input }
    }
}

def ugpg [
    ...inputs: string
    --keep (-k)
] {
    for $input in $inputs {
        let decrypted = ($input | path parse | get stem)
        gpg -d $input | save -fp $decrypted
        if (not $keep) { rm $input }
    }
}

def vgpg [file:string] {
    gpg -v --list-packets $file
}
