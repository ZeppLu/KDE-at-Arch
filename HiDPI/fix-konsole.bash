#!/bin/bash

. utils.bash

# key=src, value=dst
declare -A entries=(
    # desktop file, used when you launch konsole from most of the launchers
    ["/usr/share/applications/org.kde.konsole.desktop"]="$HOME/.local/share/applications/org.kde.konsole.desktop"
    ["/usr/share/applications/org.kde.konsole.desktop"]="$HOME/.local/share/applications/org.kde.konsole.desktop"
    # KDE only, used when you launch a shell script with konsole from dolphin
    ["/usr/share/kservices5/ServiceMenus/konsolerun.desktop"]="$HOME/.local/share/kservices5/ServiceMenus/konsolerun.desktop"
    # KDE only, used when you click "Open konsole here" from dolphin's context menu
    ["/usr/share/kservices5/ServiceMenus/konsolehere.desktop"]="$HOME/.local/share/kservices5/ServiceMenus/konsolehere.desktop"
)

declare -A apps=(
    # some applications launched in terminal mode
    ["/usr/share/applications/vim.desktop"]="$HOME/.local/share/applications/vim.desktop"
    ["/usr/share/applications/htop.desktop"]="$HOME/.local/share/applications/htop.desktop"
)


function main() {
    factor="$(get_current_scaling_factor)"
    reversed_factor="$(bc <<< "scale=10; 1 / ${factor}")"
    echo Current scaling factor is $factor, will set QT_SCALE_FACTOR to $reversed_factor

    for src in "${!entries[@]}"; do
        dst="${entries[$src]}"
        # pattern used in sed
        patterns=("-e" "s/^Exec=konsole/Exec=QT_SCALE_FACTOR=$reversed_factor konsole/")
        fill_and_install "$src" "$dst" "$patterns"
    done

    for src in "${!apps[@]}"; do
        dst="${apps[$src]}"
        patterns=("-e" "s/^Exec=\(.*\)/Exec=QT_SCALE_FACTOR=$reversed_factor konsole -e \1/" "-e" "s/^Terminal=true$/Terminal=false/")
        fill_and_install "$src" "$dst" "$patterns"
    done
}


main
