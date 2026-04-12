def transcode-videos [
    extensions: list<string> = [avi m4v mov mp4 wmv]  # optional; pass your own list
] {
    # normalize and build repeated -e flags for fd
    let cleaned_exts = (
        $extensions
        | where {|e| $e != null and ($e | str trim) != "" }
        | each {|e| $e | str trim | str downcase }
        | uniq
    )
    let eflags = ($cleaned_exts | each {|e| ['-e' $e]} | flatten)

    # the inner Nushell script fd will run for each file
    let script = '
        print $"Input:  {/}";
        print $"Output: {/.}.mkv";
        let dur = (ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "{}" | str trim | into float)
        if ($dur == null or $dur == 0) {
            print "Warning: could not read duration; proceeding without percentage.";
            ffmpeg -i "{}" -c:v libx264 -c:a aac -q:a 100 -hide_banner -loglevel error -stats "{.}.mkv"
        } else {
            ffmpeg -hide_banner -loglevel error -y -i "{}" -c:v libx264 -c:a aac -q:a 100 -progress pipe:1 "{.}.mkv"
            | lines
            # Keep only lines that have numeric time; skip the early "N/A"
            | where { |l| ($l =~ "out_time_ms=\\d+$") or ($l == "progress=end") }
            | each { |l|
                if ($l == "progress=end") {
                    print ""
                } else {
                    let ms   = ($l | str replace "out_time_ms=" "" | into int)
                    let secs = ($ms / 1000000)
                    let pct  = ($secs / $dur * 100)
                    let secs_trunc = (($secs * 1000) | math floor | ($in / 1000))
                    let dur_trunc = (($dur * 1000) | math floor | ($in / 1000))
                    # single-line live update (carriage return, no newline)
                    print -n $"\rtime=($secs_trunc)  (($pct | math round --precision 1)%) of ($dur_trunc)"
                }
            }
        }
        if ($env.LAST_EXIT_CODE == 0) {
            rm "{}"
        } else {
            print "Transcode failed; source not removed."
        }
        '
    fd -j 1 ...$eflags -x nu -c $script
}

def exts [
    --recursive (-r)
] {
    let exts = if $recursive { ls **/* } else { ls }
    $exts
    | where type == file
    | get name
    | path parse
    | get extension?
    | where {|e| $e != null and $e != ''}
    | uniq
    | sort
}

def rename [] {
    ls | where type == file | sort-by name | enumerate | each {
        |it| let ext = ($it.item.name | path parse | get extension | default '')
        let idx = $it.index | fill --width 3 --alignment right --character '0'
        if ($ext == '') {
            mv $it.item.name $idx
        } else {
            mv $it.item.name $"($idx).($ext)"
        }
    }
    null
}

def ll [] {
    ls -adt
    | sort-by name
    | sort-by type
}

def --env mk [
    input: string
] {
    mkdir $input
    cd $input
}

def cfp [
    input: string
] {
    readlink -f $input | wl-copy
}

def nget [
    ...inputs: string
] {
    for $input in $inputs {
        let file = $input | url parse | get path | path basename
        http get $input | save -fp $file
    }
}

def --env note [
    input?: string
] {
    let result = if ($input == null) {
        let now = date now | format date '%F'
        { file: $'($now).typ', dir: $now }
    } else {
        let parsed = $input | path basename
        { file: $'($parsed).typ', dir: $'($parsed)' }
    }
    mkdir $result.dir
    cd $result.dir
    let j = job spawn { typst w $result.file }
    hx $result.file
    job kill $j
}
