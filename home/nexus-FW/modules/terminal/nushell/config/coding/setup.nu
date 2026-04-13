def project_dir [lang:string, name: string] {
    if ($name == null) {
        $'($env.HOME)/Ram/($lang)_misc'
    } else {
        $'($env.HOME)/Ram/($name)'
    }
}

def --env np [
    --name (-n)
] {
    let lang = gum choose rust go python
    let name = if ($name) { gum input --placeholder="Enter project name" } else { null }


    match $lang {
        'rust' => {
            let dir = project_dir $lang $name
            if not ($dir | path exists) {
                cargo new -q $dir
            }
            cd $'($dir)/src'
            hx main.rs
        }
        'go' => {
            let dir = project_dir $lang $name
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
            let dir = project_dir $lang $name
            if not ($dir | path exists) {
                uv init $dir
            }
            cd $dir
            hx main.py
        }
        _ => {}
    }
}
