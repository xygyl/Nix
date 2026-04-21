def ctar [
    ...inputs: string
    --keep (-k)
] {
    $inputs | par-each { |input|
        tar -cpf $'($input | path basename).tar' $input
        if (not $keep) { rm -r $input }
    } | ignore
}

def utar [
    ...inputs: string
    --keep (-k)
] {
    $inputs | par-each { |input|
        tar -xpf $input
        if (not $keep) { rm -r $input }
    } | ignore
}
