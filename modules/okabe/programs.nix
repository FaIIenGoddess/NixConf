{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
    xboxdrv
  ];

  # Special Programs.
  programs = {
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
