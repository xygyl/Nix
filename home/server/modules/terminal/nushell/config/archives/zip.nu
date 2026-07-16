def czip [
    ...inputs: string
    --keep (-k)
    --encrypt (-e)
] {
    $inputs | par-each { |input|
        let archive = $"($input | path basename).zip"
        let flags = if $encrypt { "-9er" } else { "-9r" }
        ^zip $flags $archive $input
        if (not $keep) { rm $input }
    } | ignore
}
