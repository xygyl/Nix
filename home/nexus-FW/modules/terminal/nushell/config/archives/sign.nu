def sfile [
    ...inputs: path,
] {
    $inputs | par-each { |input|
        let key = $'($env.HOME)/Sync/crypt/openssl/anon_ML-DSA.pem'
        let hash_file = $'($input).sha256.tmp'
        let sig_file = $'($input).sig'

        openssl dgst -sha256 -binary $input | save -f $hash_file

        openssl pkeyutl -sign -inkey $key -rawin -in $hash_file -out $sig_file

        rm $hash_file
    } | ignore
}

def vfile [
    ...inputs: string,
] {
    $inputs | par-each { |input|
        let key = $'($env.HOME)/Sync/crypt/openssl/anon_ML-DSA_pub.pem'
        let sig = $'($input).sig'
        let hash_file = $'($input).sha256.tmp'

        openssl dgst -sha256 -binary $input | save -f $hash_file

        let result = (openssl pkeyutl -verify -pubin -inkey $key -rawin -in $hash_file -sigfile $sig | complete)
        rm $hash_file

        if $result.exit_code == 0 {
          print $'✓ Signature valid for ($input)'
        } else {
          print $'✗ Signature INVALID for ($input)'
        }
    } | ignore
}
