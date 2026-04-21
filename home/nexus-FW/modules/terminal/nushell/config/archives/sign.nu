def sign-file [
    file: path,
 --key (-k): path = "",
] {
    let key = if $key == "" { $"($env.HOME)/Sync/crypt/openssl/anon_ML-DSA.pem" } else { $key }
    let hash_file = $"($file).sha256"
    let sig_file = $"($file).sig"

    openssl dgst -sha256 -binary $file | save -f $hash_file

    openssl pkeyutl -sign -inkey $key -rawin -in $hash_file -out $sig_file

    rm $hash_file
}

def verify-file [
    file: path,
    sig: path,
    --key (-k): path = "",
] {
    let key = if $key == "" { $"($env.HOME)/Sync/crypt/openssl/anon_ML-DSA.pub.pem" } else { $key }
    let sig = if $sig == "" { $"($file).sig" } else { $sig }
    let hash_file = $"($file).sha256.tmp"

    openssl dgst -sha256 -binary $file | save -f $hash_file

    let result = (openssl pkeyutl -verify -pubin -inkey $key -rawin -in $hash_file -sigfile $sig | complete)

    rm $hash_file

    if $result.exit_code == 0 {
      print $"✓ Signature valid for ($file)"
    } else {
      print $"✗ Signature INVALID for ($file)"
    }
}
