{ config, lib, pkgs, ... }:
{
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;


  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
    "i2c-nvidia_gpu"
  ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    prime = {
      amdgpuBusId = "PCI:06:00:0";
      nvidiaBusId = "PCI:01:00:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  boot.supportedFilesystems = ["ntfs"];

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/962876D12876AFBB";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  fileSystems."/mnt/ubuntu" = {
    device = "/dev/disk/by-uuid/17b55308-ad59-4cfe-bfed-3b0f42e2ada1";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  services.printing.enable = true;
}