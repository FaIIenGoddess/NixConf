{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    eza
    git
    killall
    vim
    wget
  ];
}
