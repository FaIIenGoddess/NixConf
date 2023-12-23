{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Browser
    firefox

    # Gaming
    discord
    steam
    prismlauncher
    retroarchFull
  ];
}
