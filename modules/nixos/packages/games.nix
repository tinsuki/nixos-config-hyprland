{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
        # Terminal games & utilities
        pipes           # pipes.sh - shows pipes on your terminal
        nsnake          # nsnake - the classic snake game
        bastet          # bastet - a tetris clone with a bastard algorithm
        ninvaders       # ninvaders - space invaders clone
    ];
}