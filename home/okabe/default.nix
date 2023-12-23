{ config, pkgs, ... }:
{
  imports = [
    ../shared
    ./config.nix
    ./gtk.nix
    ./media.nix
    ./programs.nix
    ./xdg.nix
  ];
}
