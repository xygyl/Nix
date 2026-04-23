def project_dir [lang: string, name?: string] {
    if ($name == null) {
        $"($env.HOME)/Ram/($lang)_misc"
    } else {
        $"($env.HOME)/Ram/($name)"
    }
}

def --env np [
    --name (-n)
] {
    let lang = gum choose rust go python
    let name = if ($name) { gum input --placeholder="Enter project name" } else { null }
    let dir = project_dir $lang $name

    match $lang {
        "rust" => {
            if not ($dir | path exists) {
                cargo new -q --vcs none $dir
            }
            cd $"($dir)/src"
            hx main.rs
        }
        "go" => {
            if not ($dir | path exists) {
                mkdir $dir
                cd $dir
                go mod init go_misc
                touch main.go
            }
            cd $dir
            hx main.go
        }
        "python" => {
            if not ($dir | path exists) {
                uv init $dir
            }
            cd $dir
            hx main.py
        }
        _ => {}
    }
}
