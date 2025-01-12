{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # Terminal editors
      vim
      nano
      neovim

      # Zed editor - https://zed.dev/
      inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".zed-editor

      # VSCodium (Open Source Visual Studio Code) with preinstalled extensions - https://vscodium.com/
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          
          # Nix support
          bbenoist.nix

          # Catpuccin Theme
          catppuccin.catppuccin-vsc-icons
          catppuccin.catppuccin-vsc

          # Justfiles
          skellock.just

          # Open PDFs
          tomoki1207.pdf

          # Markdown
          yzhang.markdown-all-in-one
          
          # Flutter support
          dart-code.flutter
          alexisvt.flutter-snippets

          # Error lens
          usernamehw.errorlens

          # Deno support
          denoland.vscode-deno

          # Kubernetes
          ms-kubernetes-tools.vscode-kubernetes-tools
          redhat.vscode-yaml
          redhat.vscode-xml

          # Docker
          ms-azuretools.vscode-docker

          # Paths intellisense
          christian-kohler.path-intellisense

          # Rust support
          rust-lang.rust-analyzer

          # Better comments
          aaron-bond.better-comments

          # Live server for web development
          ritwickdey.liveserver

          # Python support
          ms-python.python

          # Color highlight to see colors in code
          naumovs.color-highlight

          # REST client
          humao.rest-client

          # Prettier implementation for vscode
          esbenp.prettier-vscode

          # Auto rename tag to rename tags in html
          formulahendry.auto-rename-tag

          # Environment variables
          irongeek.vscode-env

          # Rust analyzer for better Rust support
          rust-lang.rust-analyzer

          # Typst support
          myriad-dreamin.tinymist

          # Github copilot for AI code completion
          github.copilot
        ];
      })

      # Jetbrains Tools - https://www.jetbrains.com/
      jetbrains.clion                 # C++
      jetbrains.webstorm              # JS TS 
      jetbrains.phpstorm              # PHP
      jetbrains.rust-rover            # Rust
      jetbrains.pycharm-professional  # Python
      jetbrains.idea-ultimate         # Java, Kotlin
      jetbrains.datagrip              # Database viewer/ide
      jetbrains.rider                 # C#
      # Jetbrains OpenJDK fork to better support Jetbrains's products
      pkgs.jetbrains.jdk

      # Libre Office suite - https://www.libreoffice.org/
      libreoffice
  ];
}