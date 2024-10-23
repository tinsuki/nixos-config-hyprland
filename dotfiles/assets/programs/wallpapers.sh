#!/bin/bash

wallpapersDir=/home/tinsuki/.dotfiles/assets/wallpapers
wallpapers=("$wallpapersDir"/*)
transitionAngle=$(($RANDOM % (360 - 1)))

while true; do
    # Check if the wallpapers array is empty
    if [ ${#wallpapers[@]} -eq 0 ]; then
        # If the array is empty, refill it with the image files
        wallpapers=("$wallpapersDir"/*)
    fi

    transitionAngle=$(($RANDOM % (360 - 1)))
    echo $transitionAngle

    # Select a random wallpaper from the array
    wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
    selectedWallpaper="${wallpapers[$wallpaperIndex]}"

    # Update the wallpaper using the swww img command
    swww img "$selectedWallpaper" --transition-type random --transition-fps 165 --transition-angle $transitionAngle

    # Remove the selected wallpaper from the array
    unset "wallpapers[$wallpaperIndex]"

    # Delay for 30 mins before selecting the next wallpaper
    sleep 30m
done