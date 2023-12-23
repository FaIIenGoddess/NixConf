{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza";
      ls = "eza -la --group-directories-first";
      lt = "eza -T -I \"node_modules|venv|Build\"";
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
    };
    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      eval "$(starship init zsh)"
      echo -n "$(pfetch)"
    '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      username = {
        style_user = "#B16286 bold";
        style_root = "black bold";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol](bold blue)@[$hostname](bold #B16286) ";
        disabled = false;
      };
      directory = {
        style = "#458588";
        truncation_length = 4;
        truncation_symbol = ".../";
      };
    };
  };
}
