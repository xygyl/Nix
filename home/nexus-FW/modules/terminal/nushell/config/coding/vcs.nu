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
def jjs [] {
    jj git fetch
    let branch = jj bookmark list
        | lines
        | each {
            |line| $line
                | split row " "
                | first
                | str trim --right --char ":"
            }
        | str join "\n"
        | gum filter --placeholder "Pick a bookmark..."
    jj new $branch
    $branch | save -f /tmp/jj-current-branch
}

def jje [] {
  let branch = (open /tmp/jj-current-branch | str trim)
  jj describe --editor
  jj bookmark set $branch -r "@"
  jj git push
  rm /tmp/jj-current-branch
}
