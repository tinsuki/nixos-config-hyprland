{ config, pkgs, ...}:
{
  programs.bash.enable = true;

  programs.bash = {
    
    shellAliases = {
      # ls shortcuts
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      la = "ls -A";
      lla = "ls -al";

      # nix shortcuts
      remove-tofi-cache = "rm /home/tinsuki/.cache/tofi-*";
      clear_dotfiles_history = "sudo rm -rf ~/.dotfiles.back.*";
      clear_nix_config_history = "sudo rm -rf /etc/nixos.back.*";
      clean-garbage = "nix-env --delete-generations -p /home/tinsuki/.local/state/nix/profiles/home-manager/ old && nix-env --delete-generations -p /home/tinsuki/.local/state/nix/profiles/profile/ old && sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system-profiles/gnome old && sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system-profiles/hyprland old && sudo nix-collect-garbage";
      clean-os="clean-garbage && clear_nix_config_history && clear_dotfiles_history";
      # clear and fastfetch
      cleart = "clear && fastfetch";
      clr = "clear && fastfetch";
      c = "clear && fastfetch";

      # Docker compose shortcuts
      dc = "docker compose";
      # start containers with docker compose
      dcu = "docker compose up";
      # start containers with docker compose detached
      dcud = "docker compose up -d";
      # build and start containers with docker compose
      dcub = "docker compose up --build";
      # build and start containers with docker compose detached
      dcubd = "docker compose up --build -d";
      # remove containers with docker compose
      dcrm = "docker compose rm";
      # restart containers with docker compose
      dcrs = "docker compose restart";
      # rebuild containers with docker compose
      dcrb = "docker compose rebuild";
      # run command in containers with docker compose
      dcr = "docker compose run";
      # stop containers with docker compose
      dcd = "docker compose down";
      # exec command in containers with docker compose
      dce = "docker compose exec";
      # logs of containers with docker compose
      dcl = "docker compose logs";
      # ps of containers with docker compose
      dcp = "docker compose ps";
      # top of containers with docker compose
      dct = "docker compose top";
      # images of containers with docker compose
      dci = "docker compose images";
      # pull images of containers with docker compose
      dcip = "docker compose pull";
      # build images of containers with docker compose
      dcib = "docker compose build";
      # push images of containers with docker compose
      dcipu = "docker compose push";


      # Get latest container ID
      dl="docker ps -l -q";
      # Get container process
      dps="docker ps";
      # Get process included stop container
      dpa="docker ps -a";
      # Get images
      di="docker images";
      # Get container IP
      dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'";
      # Run daemonized container, e.g., $dkd base /bin/echo hello
      dkd="docker run -d -P";
      # Run interactive container, e.g., $dki base /bin/bash
      dki="docker run -i -t -P";
      # Execute interactive container, e.g., $dex base /bin/bash
      dex="docker exec -i -t";
      # Stop all containers
      dstop="docker stop $(docker ps -a -q)";
      # Remove all containers
      drm="docker rm $(docker ps -a -q)";
      # Stop and Remove all containers
      drmf="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)";
      # Remove all images
      dri="docker rmi $(docker images -q)";
      # Dockerfile build, e.g., $dbu tcnksm/test
      dbu="docker build -t=$1 .";
      # Bash into running container
      dbash="docker exec -it $(docker ps -aqf 'name=$1') bash";

      ## a quick way to get out of current directory ##
      ".."="cd ..";
      "..."="cd ../../../";
      "...."="cd ../../../../";
      "....."="cd ../../../../";
      ".4"="cd ../../../../";
      ".5"="cd ../../../../..";

      ## Colorize the grep command output for ease of use (good for log files)##
      grep="grep --color=auto";
      egrep="egrep --color=auto";
      fgrep="fgrep --color=auto";

      mkdir="mkdir -pv";

      now="date +'%T'";
      nowtime="now";
      nowdate="date +'%d-%m-%Y'";

      # do not delete / or prompt if deleting more than 3 files at a time #
      rm="rm -I --preserve-root";
 
      # confirmation #
      mv="mv -i";
 
      # Parenting changing perms on / #
      chown="chown --preserve-root";
      chmod="chmod --preserve-root";
      chgrp="chgrp --preserve-root";
    };

    bashrcExtra = ''
      # Enable OyMyPosh with installede configuration
      eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/config.json)"

      # Show docker and docker compose aliases
      dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }
    
      # Start fastfetch if terminal is big enough
      if [[ $(tput lines) -ge 43 && $(tput cols) -ge 92 ]]; then
	      fastfetch
      fi

      # Export TERM=xterm-256color for kitty terminal ssh sessions
      [[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh" 

      # Export flutter & flutter related path
      flutter_sdk=$(readlink -f $(which flutter) | awk '{sub(/\/flutter$/,"")}1')
      export PATH="$flutter_sdk:$PATH";
      export CHROME_EXECUTABLE="$(which chromium)"; 

      # Export Android related paths
      export ANDROID_HOME="/home/tinsuki/Android/Sdk";

      # Export Deno related paths
      export PATH="/home/tinsuki/.deno/bin:$PATH"
    '';
  };

  # Make OhMyPosh integrated w/ bash
  programs.oh-my-posh.enableBashIntegration = true;

  # Make Zoxide available to bash
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  # Make FZF available to bash
  programs.fzf.enable = true;
}