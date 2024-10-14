# firewall.nix
# This file is a part of the NixOS configuration of the system.
# It is used to configure the firewall of the system.
# Allow only http and https traffic and ssh
{ config, lib, pkgs, ... }:
{
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 22 ];
}