{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    zulu    # Zulu 21 - https://www.azul.com/downloads/?package=jdk#zulu
    zulu17  # Zulu 17 

    # OpenJDK
    jdk8   # jdk 8 from https://jdk.java.net/8/
    jdk23 # jdk 23 from https://jdk.java.net/23/
    jdk # jdk 21 from https://jdk.java.net/21/
    jdk17 # jdk 17 from https://jdk.java.net/17/
    jdk11 # jdk 11 from https://jdk.java.net/11/

    # gradle - https://gradle.org/
    gradle
  ];
}