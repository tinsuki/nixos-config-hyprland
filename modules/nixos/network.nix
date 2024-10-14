{ config, lib, pkgs, ... }:
{
  networking.hostName = "nix-strix-g15";
  networking.networkmanager.enable = true;
}