alias aria = aria2c -x16 -s16 -c --file-allocation=none --seed-time=0 --listen-port=14484
alias cat  = bat -p
alias c    = clear
alias cp   = cp -runp
alias dua  = dua -f metric i
alias e    = exit
alias l    = eza -lah --sort=type --total-size
alias ouch = ouch -q
alias rco  = rustc -C opt-level=3 -C strip=symbols -C lto=true -C codegen-units=1 -C target-cpu=native
alias rc   = rustc
alias rm   = rm -r
alias r    = rsync -ah --delete --inplace --no-whole-file --info=progress2
alias rv   = rsync -avh --delete --inplace --no-whole-file --info=progress2
alias wifi = sudo su -c "systemctl restart NetworkManager.service"
alias yt   = yt-dlp --cookies-from-browser firefox --merge-output-format mp4
