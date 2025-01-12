# Default options
update=0
impure=0

show_help() {
    echo "Usage: ./install.sh [options]"
    echo "Options:"
    echo "  --update       Update the system version"
    echo "  --impure       Use an impure build for nixos-rebuild"
    echo "  -h, --help     Show this help message and exit"
}

# Check sudo privileges
if ! sudo -l &>/dev/null; then
    echo "You do not have sudo rights."
    echo "Please run the script with sudo."
    echo "sudo $0 $@"
    exit 1
fi

# Parse arguments using a while-loop and case
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --update)
            update=1
            ;;
        --impure)
            impure=1
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
    shift
done

# Backup of existing configuration with timestamp
echo "Backing up existing generation configuration files..."
if [[ ! -d "/etc/nixos_backups" ]]; then
    sudo mkdir -p /etc/nixos_backups/
fi
sudo tar -Jcvf /etc/nixos_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz /etc/nixos/ 2> /dev/null

# Clear /etc/nixos directory
sudo rm -rf /etc/nixos/*

# Generate hardware configuration
sudo nixos-generate-config
sudo cp /etc/nixos/hardware-configuration.nix ./hosts/nix-strix-g15/
sudo rm -rf /etc/nixos/*

# Copy new configuration files
sudo cp -r ./* /etc/nixos/
sudo cp -r ./*.* /etc/nixos/

# Backup and copy dotfiles
if [[ ! -d "$HOME/.dotfiles" ]]; then
    mkdir -p "$HOME/.dotfiles"
    cp -r ./dotfiles/* "$HOME/.dotfiles/"
else
    echo "Creating backup of the ~/.dotfiles folder"
    if [[ ! -d "$HOME/.dotfiles_backups" ]]; then
        mkdir -p "$HOME/.dotfiles_backups"
    fi
    sudo tar -Jcvf $HOME/.dotfiles_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz $HOME/.dotfiles/
    echo "Copying the new dotfiles to the ~/.dotfiles folder"
    cp -rf ./dotfiles/* $HOME/.dotfiles
fi

# Construct the nixos-rebuild command
rebuild_command="sudo nixos-rebuild"

if [[ $update -eq 1 ]]; then
    rebuild_command+=" boot"
else
    rebuild_command+=" switch"
fi

rebuild_command+=" -p hyprland --flake /etc/nixos/#nix-strix-g15"

if [[ $impure -eq 1 ]]; then
    rebuild_command+=" --impure"
fi

# Execute the constructed command
echo "Executing: $rebuild_command"
eval "$rebuild_command"
