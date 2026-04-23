def up [] {
    # sudo su -c 'wg-quick up /etc/wireguard/AVPN.conf'
    sudo su -c 'wg-quick up /home/xygyl/Documents/AVPN.conf'
    sudo su -c 'iptables -A INPUT -p tcp --dport 14484 -j ACCEPT'
}
def down [] {
    # sudo su -c 'wg-quick down /etc/wireguard/AVPN.conf'
    sudo su -c 'wg-quick down /home/xygyl/Documents/AVPN.conf'
    sudo su -c 'iptables -D INPUT -p tcp --dport 14484 -j ACCEPT'
}
