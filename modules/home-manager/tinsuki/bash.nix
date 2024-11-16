{ config, pkgs, ...}:
{
  programs.bash.enable = true;

  programs.bash = {
    
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      remove-tofi-cache = "rm /home/tinsuki/.cache/tofi-*";
      cleart = "clear && fastfetch";
      clr = "clear && fastfetch";
      c = "clear && fastfetch";
      dcu = "docker compose up";
      dcud = "docker compose up -d";
      dcub = "docker compose up --build";
      dcubd = "docker compose up --build -d";
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
      eval "$(oh-my-posh init bash --config /home/tinsuki/.config/oh-my-posh/config.json)"
    
      if [[ -n $KITTY_WINDOW_ID && $(tput lines) -ge 43 && $(tput cols) -ge 92 ]]; then
	      fastfetch
      fi

      # Show all alias related docker
      dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; };
    '';
  };
}