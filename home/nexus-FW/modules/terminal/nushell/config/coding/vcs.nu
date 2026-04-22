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
        cd $'($env.HOME)/Ram/'
    }

    let depth_args = if ($depth != null) { [--depth $depth] } else { [] }

    $inputs | par-each { |input|
        let args = ["git" "clone" "--quiet" ...$depth_args $input]
        run-external "jj" ...$args
    }

    if ($inputs | length) == 1 {
        let dir = $inputs.0
            | url parse
            | get path
            | path basename
            | path parse
            | get stem
        cd $dir
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
