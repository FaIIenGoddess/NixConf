{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./programs.nix
    ./sway.nix
  ];
}
