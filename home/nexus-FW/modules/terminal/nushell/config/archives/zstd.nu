def czst [
    ...inputs: string
    --keep (-k)
] {
    for $input in $inputs {
        match ($input | path type) {
            'dir' => {
                let archive = $'($input | path basename).tar'
                tar -cpf $archive $input
                if (not $keep) { rm -r $input }
                zstd --rm --ultra -22 --long=31 -T0 --auto-threads=logical $archive
            }
            'file' => {
                zstd --ultra -22 --long=31 -T0 --auto-threads=logical $input
                if (not $keep) { rm $input }
            }
        }
    }
}

def uzst [
    ...inputs: string
    --keep (-k)
] {
    $inputs | par-each { |input|
        zstd -d --long=31 $input
        let archive = ($input | path parse | get stem)
        if ($archive | path parse | get extension) == 'tar' {
            tar -xpf $archive
            rm $archive
        }
        if (not $keep) { rm $input }
    } | ignore
}
