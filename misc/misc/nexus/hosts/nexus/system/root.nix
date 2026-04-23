{
  programs.bash = {
    enable = true;

    shellAliases = {
      e = "exit";
      c = "clear";
      monero = "monerod --zmq-pub tcp://127.0.0.1:18083 --out-peers 32 --in-peers 64 --add-priority-node=p2pmd.xmrvsbeast.com:18080 --add-priority-node=nodes.hashvault.pro:18080 --disable-dns-checkpoints --enable-dns-blocklist --prune-blockchain";
      p2pool = "p2pool --loglevel 1 --mini --host 127.0.0.1 --wallet 42dG9W8XDFFZm8Ro2e2EWFUi5XmxuKz6vimzogp95tK3XoX6oHncjpLA5RXET8ti9zihYpBwGjeANHjsSnjMbp54Nw73ByW";
      xmr = "xmrig --randomx-1gb-pages --threads=16 -o 127.0.0.1:3333";
    };
  };
}

