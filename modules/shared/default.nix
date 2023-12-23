{ config, pkgs, ... }:
{
  imports = [
    ./programs.nix
    ./usergroup.nix
  ];
}
