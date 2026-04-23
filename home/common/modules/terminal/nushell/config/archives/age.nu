def cage [
    ...inputs: string
    --armor (-a)
    --keep (-k)
    --symmetric (-s)
] {
    let pub_key = $"($env.HOME)/Sync/crypt/age/anon.pub"
    $inputs | par-each { |input|
        let encrypted = $"($input).age"
        mut flags = if $symmetric {
            ["-p" -o $encrypted $input]
        } else {
            ["-R" $pub_key -o $encrypted $input]
        }
        if $armor { $flags = ($flags | prepend "-a") }
        age ...$flags
        if (not $keep) { rm $input }
    } | ignore
}

def uage [
    ...inputs: string
    --keep (-k)
    --symmetric (-s)
] {
    let priv_key = $"($env.HOME)/Sync/crypt/age/anon.age"
    $inputs | par-each { |input|
        let decrypted = ($input | path parse | get stem)
        if $symmetric {
            age -d -o $decrypted $input
        } else {
            age -d -i $priv_key -o $decrypted $input
        }
        if (not $keep) { rm $input }
    } | ignore
}

def vage [
    input: string
] {
    age-inspect --json $input | from json
}
