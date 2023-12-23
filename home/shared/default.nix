{ config, pkgs, ... }:
{
  # home-manager configurations, tools, and programs that apply across all systems.
  imports = [
    ./programs.nix
    ./shell.nix
    ./zsh.nix
  ];
  
  # Configuration for the user this file applies to.
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  # Git configuration.
  programs.git = {
    enable = true;
  };
  
  # Github CLI tool
  programs.gh = {
    enable = true;
  };

  # gpg
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  # What version to lock interpretation of the config file.
  # Do not change this unless you want to rewrite most of your config files.
  home.stateVersion = "23.11";

  # Let Home-manager install and manage itself.
  programs.home-manager.enable = true;
}
