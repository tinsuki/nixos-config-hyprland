{ inputs, config, lib, pkgs, ... }: { 

  # Docker, Podman, VirtualBox and LibVirtd configuration;
  virtualisation = { 

    # Documentation : https://docs.docker.com/get-started/docker-overview/
    # on NixOS      : https://nixos.wiki/wiki/Docker
    docker = {
      enable = true;

      # Enable rootless to avoid security issues with the "docker" group
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    # Documentation : https://www.libvirt.org/manpages/libvirtd.html
    # on NixOS      : https://nixos.wiki/wiki/Libvirt
    libvirtd = {
      enable = true;
    };

    # Documentation : https://www.virtualbox.org/
    # on NixOS      : https://nixos.wiki/wiki/VirtualBox
    virtualbox.host = {
      enable = true;

      # Make Guest Additions available
      enableExtensionPack = true;
    };

    # Documentation : https://docs.podman.io/en/latest/Introduction.html
    # on NixOS      : https://nixos.wiki/wiki/Podman
    podman = {
      enable = true;

      # Create internal podman network dns
      defaultNetwork.settings.dns_enabled = true;
    };

    containers = {
      enable = true;
    };
  };

  # https://nixos.wiki/wiki/Virt-manager
  programs.virt-manager.enable = true;

  # Nvidia GPU passthrough
  hardware.nvidia-container-toolkit.enable = true;

  # Install required packages
  environment.systemPackages = with pkgs; [

    # Install QEMU - https://www.qemu.org/
    qemu_full

    # Dive allows to search through Docker containers layers
    dive

    # Podman management tools cli & desktop
    podman-tui
    podman-desktop
  ];

}