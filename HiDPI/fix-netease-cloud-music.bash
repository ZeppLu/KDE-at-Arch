#!/bin/bash

. utils.bash

# key=src, value=dst
declare -A app=(
    ["/usr/share/applications/netease-cloud-music.desktop"]="$HOME/.local/share/applications/netease-cloud-music.desktop"
)

function main() {
    factor="$(get_current_scaling_factor)"
    reversed_factor="$(bc <<< "scale=10; 1 / ${factor}")"
    echo Current scaling factor is $factor, will set QT_SCALE_FACTOR to $reversed_factor

    for src in "${!app[@]}"; do
        dst="${app[$src]}"
        # pattern used in sed
        patterns=("-e" "s/^\(Exec=netease-cloud-music.*\)$/\1 --force-device-scale-factor=$factor/")
        fill_and_install "$src" "$dst" "$patterns"
    done
}


main

