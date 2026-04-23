def ctar [
    ...inputs: string
    --keep (-k)
] {
    for $input in $inputs {
        tar -cpf $'($input | path basename).tar' $input
        if (not $keep) { rm -r $input }
    }
}

def utar [
    ...inputs: string
    --keep (-k)
] {
    for $input in $inputs {
        tar -xpf $input
        if (not $keep) { rm -r $input }
    }
}
