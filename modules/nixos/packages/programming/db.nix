{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # SQLite - https://www.sqlite.org/index.html
    sqlite
    
    # Prismas ORM - https://www.prisma.io/
    prisma-engines
  ];
}