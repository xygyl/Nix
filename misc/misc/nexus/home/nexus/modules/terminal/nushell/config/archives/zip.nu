def czip [
    ...inputs: string
    --keep (-k)
    --encrypt (-e)
] {
    for $input in $inputs {
        let archive = $'($input | path basename).zip'
        let flags = if $encrypt { '-9er' } else { '-9r' }
        ^zip $flags $archive $input
        if (not $keep) { rm $input }
    }
}
