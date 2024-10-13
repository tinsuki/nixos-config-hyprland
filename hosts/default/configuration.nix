# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Use gtub-bootloader.nix to configure the GRUB bootloader with options 
      # from the ../../modules/nixos/grub-bootloader.nix module.
      ../../modules/nixos/grub-bootloader.nix
      # "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/legion/15ach6h"
      inputs.home-manager.nixosModules.default
    ];

  # use the option to enable the GRUB bootloader
  services.grub-bootloader.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Enabling hyprland
  programs.hyprland = {
    enable = true;

    # Make X application work
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # Enable blueman in order to manage bluetooth.
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the flakes feature with the nix-command cli
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     fzf
     oh-my-posh
     asdf
     wget
     zoxide
     neovim
     spotify
     spotify-tray
     lsb-release
     btop
     qemu
     valgrind
     virtualbox
     vagrant
     vlc
     rustup
     gcc
     cmake
     sqlite
     ninja


    # Installation of waybar, to copy the Simpl Hyprland theme ig
    pkgs.waybar
    killall

    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    # Logout menu
    wlogout

    # Notifications deamon
    pkgs.dunst
    libnotify

    # Screenshots helper
    grimblast

    # File explorer
    gnome.nautilus

    # Wallpaper daemon
    swww

    # Default terminal
    kitty

    # App launcher
    tofi

    # Network Manager applet
    networkmanagerapplet

    # Clipboard support
    wl-clipboard
    cliphist

    # PulseAudio command line mixer
    pamixer
    # Pulseaudio volume control
    pavucontrol
    # PlayerCTL control media players from cli
    playerctl

    # Brightness CTL
    brightnessctl

    # Start with numlock enabled
    numlockx

    # zen browser
    inputs.zen-browser.packages."${system}".default
  ];

  # https://nixos.wiki/wiki/Fonts
  fonts.packages = with pkgs; [
    # https://github.com/ryanoasis/nerd-fonts
    nerdfonts
  ];

  # Enable docker
  virtualisation.docker.enable = true;
  # Enable support for BTRFS disk format
  # virtualisation.docker.storageDriver = "btrfs";
  # Make docker access rootless (users w/ docker group are not root-equivalent)
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
