{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Communicate
    teams-for-linux     # Teams - https://www.microsoft.com/en-us/microsoft-teams/log-in
    (
      pkgs.discord.override {
        withVencord = true;  # Active le plugin Vencord pour Discord
      }
    )

    # Prism Launcher / MultiMC alternative for Minecraft related teamwork - https://prismlauncher.org/
    prismlauncher

    # One Drive - https://nixos.wiki/wiki/OneDrive
    onedrive
  ];
}