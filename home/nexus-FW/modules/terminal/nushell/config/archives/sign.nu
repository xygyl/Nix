def sfile [
    ...inputs: string,
] {
    $inputs | par-each { |input|
        let hash = $'($input).sha256.tmp'
        let key = $'($env.HOME)/Sync/crypt/openssl/anon_ML-DSA.pem'
        let sig = $'($input).sig'

        openssl dgst -sha256 -binary $input | save -f $hash

        openssl pkeyutl -sign -inkey $key -rawin -in $hash -out $sig

        rm $hash
    } | ignore
}

def vfile [
    ...inputs: string,
] {
    $inputs | par-each { |input|
        let hash = $'($input).sha256.tmp'
        let key = $'($env.HOME)/Sync/crypt/openssl/anon_ML-DSA_pub.pem'
        let sig = $'($input).sig'

        openssl dgst -sha256 -binary $input | save -f $hash

        let result = (openssl pkeyutl -verify -pubin -inkey $key -rawin -in $hash -sigfile $sig | complete)
        rm $hash

        if $result.exit_code == 0 {
          print $'✓ Signature valid for ($input)'
        } else {
          print $'✗ Signature INVALID for ($input)'
        }
    } | ignore
}
