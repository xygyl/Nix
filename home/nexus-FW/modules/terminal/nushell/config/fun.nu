def model [
    input: string
] {
    let name = $input | path basename
    $'FROM ($input)' | save -f Modelfile
    ollama create $name -f Modelfile
    rm Modelfile
    ollama run $name
}

alias pipes = pipes-rs
alias bonsai = cbonsai -il
alias astro = astroterm -i "san antonio" -Ccum -f 165 -s 1000

def fetch [] {
    clear
    macchina
}

def --env d [
    --download (-d)
    input?: string
] {
    if $download {
        cd $'($env.HOME)/Downloads/'
        if not ($'($env.HOME)/Downloads/($input)' | path exists) {
            mkdir $input
        }
        mv *.torrent $input
        cd $input
        aria2c -x16 -s16 -c --file-allocation=none --seed-time=0 --listen-port=14484 *.torrent
    } else {
        cd ~/Documents/.misc/porn/doujin/
        y
    }
}

def chess [
    --depth (-d): int
] {
    let engine = which stockfish | get path | first
    if ($depth == null) {
        chess-tui -l lip_2thj0jXzvIl3Ht1bMK0d -e $engine
    } else {
        chess-tui -l lip_2thj0jXzvIl3Ht1bMK0d -e $engine -d $depth
    }
}

def wth [] {
    clear
    wthrr
}

def moon [] {
    clear
    curl wttr.in/Moon
}
