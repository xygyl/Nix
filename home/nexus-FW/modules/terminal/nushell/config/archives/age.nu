def cage [
    input: string
    --armor (-a)
    --keep (-k)
    --symmetric (-s)
] {
    let pub_key = $'($env.HOME)/Sync/age/anon.pub'
    mut flags = if $symmetric {
        ['-d']
    } else {
        ['-R' $'($pub_key)' $'($input)']
    }
    if $armor { $flags = ($flags | prepend '-a') }
    age ...$flags | save $'($input).age'
    if (not $keep) { rm $input }
}

def uage [
    input: string
    --keep (-k)
] {
    let priv_key = $'($env.HOME)/Sync/age/anon.age'
    let decrypted = ($input | path parse | get stem)
    age -d -i $priv_key -o $decrypted $input
    if (not $keep) { rm $input }
}

def vage [input: string] {
    age-inspect --json $input | from json
}
