def carch [
    ...inputs: string #The directory to archive.
    --no-compress (-n) #Skips compression.
    --keep (-k) #Keeps the input folder.
    --compression-method (-m): string #Sets compression method to either zstd or xz. Defaults to zstd.
] {
    let pub_key = $"($env.HOME)/Sync/crypt/age/anon.pub"
    let now     = (date now | format date %F)
    $inputs | par-each { |input|
        let base       = ($input | path basename)
        let tarball    = $"($base).tar"
        let compressed = match $compression_method {
            null | "zst" => { $"($tarball).zst" }
            "xz" => { $"($tarball).xz" }
            _ => { error make { msg: $"Unsupported compression method: ($compression_method)" } }
        }
        match ($input | path type) {
            "dir" => {
                if $no_compress {
                    if $keep { ctar -k $base } else { ctar $base }
                    age -R $pub_key -o $"($now)_($tarball).age" $tarball
                    rm $tarball
                } else {
                    match $compression_method {
                        null | "zst" => { if $keep { czst -k $base } else { czst $base } }
                        "xz" => { if $keep { cxz -k $base } else { cxz $base } }
                        _ => {}
                    }
                    age -R $pub_key -o $"($now)_($compressed).age" $compressed
                    rm $compressed
                }
            }
            "file" => {
                age -R $pub_key -o $"($now)_($base).age" $base
                if (not $keep) { rm $base }
            }
        }
    } | ignore 
}

def uarch [
    ...inputs: string #The input to unarchive.
    --keep (-k) #Keeps the input input.
] {
    let priv_key = $"($env.HOME)/Sync/crypt/age/anon.age"
    $inputs | par-each { |input|
        let base      = ($input | str replace -r "^[^_]+_" "")
        let decrypted = ($base | path parse | get stem)
        let tarball   = ($decrypted | path parse | get stem)
        age -d -i $priv_key -o $decrypted $input
        match ($decrypted | path parse | get extension) {
            "zst" => { uzst $decrypted }
            "xz" => { uxz $decrypted }
            "tar" => { utar $decrypted }
            _ => {}
        }
        if (not $keep) { rm $input }
    } | ignore 
}
