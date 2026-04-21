let mount_point = $'($env.HOME)/Documents/main'
let key = $'($env.HOME)/Sync/crypt/main_key.key'

def mmain [] {
    sudo cryptsetup open --key-file $key /dev/sda main
    sudo mount -o compress=zstd,noatime /dev/mapper/main $mount_point
    print $'Mounted at ($mount_point)'
}

def umain [] {
    sudo umount $mount_point
    sudo cryptsetup close main
    print "Unmounted and closed"
}                
