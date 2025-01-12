{ config, lib, pkgs, inputs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    enable32Bit = true;
    extraPackages32 = with pkgs; [ nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:01:00:0";
      amdgpuBusId = "PCI:06:00:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  
  boot.supportedFilesystems = ["ntfs"];

  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
    "i2c-nvidia_gpu"
  ];

  services.power-profiles-daemon.enable = true;

  fileSystems."/run/media/tinsuki/windows" = {
    device = "/dev/disk/by-uuid/962876D12876AFBB";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  fileSystems."/run/media/tinsuki/jeux" = {
    device = "/dev/disk/by-uuid/CC7622147621FFB6";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  services.printing.enable = true;
}
