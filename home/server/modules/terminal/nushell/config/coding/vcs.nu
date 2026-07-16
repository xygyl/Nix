def gita [
    input: string
] {
    git add -A
    git commit -m $input
    git push
}

def --env gitc [
    --depth (-d): int
    --temp (-t)
    ...inputs: string
] {
    if $temp {
        cd $"($env.HOME)/Ram/"
    }

    let depth_args = if ($depth != null) { [--depth $depth] } else { [] }

    match ($inputs | length) {
        0 => {
           error make { msg: "Please provide a link" } 
        }
        1 => {
            let input = $inputs.0

            let args = ["git" "clone" ...$depth_args $input]
            run-external "jj" ...$args

            let dir = $input
                | url parse
                | get path
                | path basename
                | path parse
                | get stem
            cd $dir
        }
        _ => {
            $inputs | par-each { |input|
                let args = ["git" "clone" "--quiet" ...$depth_args $input]
                run-external "jj" ...$args
            }
        }
    }
}

def jj_gum_select_bookmark [] {
    jj bookmark list
        | lines
        | each {
            |line| $line
                | split row " "
                | first
                | str trim --right --char ":"
            }
        | str join "\n"
        | gum filter --placeholder "Pick a bookmark..."
}

def jjn [
    --same (-s)
] {
    let branch = jj_gum_select_bookmark 
    jj new $branch
}

def jjs [] {
    jj git fetch
    jjn
}

def jje [] {
    let branch = jj_gum_select_bookmark 
    jj describe --editor
    jj bookmark set $branch -r "@"
    jj git push
}
