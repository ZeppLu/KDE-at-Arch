function get_current_scaling_factor() {
    # this function only works on KDE
    config_file="$HOME/.config/kdeglobals"
    section_name="KScreen"
    key_name="ScaleFactor"

    # XXX: section name is ignored for now
    factor="$(grep "^${key_name}=" "$config_file" | cut -d'=' -f2)"
    echo ${factor}
}

function fill_and_install() {
    src="$1"
    dst="$2"
    patterns="$3"

    if [ -f "$dst" ]; then
        echo $dst already present, backing it up...
        mv "$dst" "$dst.backup"
    fi

    echo Generating $dst based on $src...
    sed "${patterns[@]}" "$src" > "$dst"
}

