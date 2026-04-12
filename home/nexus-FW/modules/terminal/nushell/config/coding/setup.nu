def --env np [
    --name (-n)
] {
    let lang = gum choose rust go python
    let name = if ($name) { gum input } else { null }

    match $lang {
        'rust' => {
            let dir = if ($name == null) {
                $'($env.HOME)/Ram/rust_misc'
            } else {
                $'($env.HOME)/Ram/($name)'
            }
            if not ($dir | path exists) {
                cargo new -q $dir
            }
            cd $'($dir)/src'
            hx main.rs
        }
        'go' => {
            let dir = if ($name == null) {
                $'($env.HOME)/Ram/go_misc'
            } else {
                $'($env.HOME)/Ram/($name)'
            }
            if not ($dir | path exists) {
                mkdir $dir
                cd $dir
                go mod init go_misc
                touch main.go
            }
            cd $dir
            hx main.go
        }
        'python' => {
            let dir = if ($name == null) {
                $'($env.HOME)/Ram/python_misc'
            } else {
                $'($env.HOME)/Ram/($name)'
            }
            if not ($dir | path exists) {
                uv init $dir
            }
            cd $dir
            hx main.py
        }
        _ => {}
    }
}

def --env carp [
    input?: string
] {
    let dir = if ($input == null) {
        $'($env.HOME)/Ram/misc'
    } else {
        $'($env.HOME)/Ram/($input)'
    }
    if not ($dir | path exists) {
        cargo new -q $dir
    }
    cd $'($dir)/src'
    hx main.rs
}
