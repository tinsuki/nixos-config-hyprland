{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    git             # Git        - https://git-scm.com/
    lazygit         # LazyGit    - https://github.com/jesseduffield/lazygit
    gh              # GitHub CLI - https://cli.github.com/
    pkgs.gitkraken  # Client Git graphique pour gérer les dépôts Git

    watchman        # Watchman   - https://facebook.github.io/watchman/docs/install
  ];
}