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

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  hardware.nvidia.prime = {
		amdgpuBusId = "PCI:06:00:0";
		nvidiaBusId = "PCI:01:00:0";
	};

  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia-drm.fbdev=1"];

  services.printing.enable = true;
}