def cxz [
    ...inputs: string
    --keep (-k)
] {
    for $input in $inputs {
        match ($input | path type) {
            "dir" => {
                let archive = $"($input | path basename).tar"
                tar -cpf $archive $input
                if (not $keep) { rm -r $input }
                xz -z -9e -T0 --memlimit=32GiB --lzma2=dict=1536MiB $archive
            }
            "file" => {
                xz -k -z -9e -T0 --memlimit=32GiB --lzma2=dict=1536MiB $input
                if (not $keep) { rm $input }
            }
        }
    }
}

def uxz [
    ...inputs: string
    --keep (-k)
] {
    $inputs | par-each { |input|
        unxz -k $input
        let archive = ($input | path parse | get stem)
        if ($archive | path parse | get extension) == "tar" {
            tar -xpf $archive
            rm $archive
        }
        if (not $keep) { rm $input }
    } | ignore
}
