{ config, lib, pkgs, ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ]; #change it locally and don't push it to the repo to avoid security issues
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "tinsuki" ]; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = true;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}