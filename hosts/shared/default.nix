{ config, pkgs, home-manager, ... }:
{
  imports = [
    ../../modules/shared
  ];
  # Set your time zone.
  time.timeZone = "America/Chicago";
  # Use Local time for the hardware clock for compatibility with windows.
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap for/in X11.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Allow Unfree packages for software like steam.
  nixpkgs.config.allowUnfree = true;

  # Shells
  programs.zsh.enable = true;
  environment.shells = with pkgs; [
    zsh
    bash
  ];
  # Set user's default shell system-wide.
  users.defaultUserShell = pkgs.zsh;

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Environment variables to be applied to the entire system
  environment.variables = {
    TZ = "${config.time.timeZone}";
  };

  system = {
    copySystemConfiguration = false;
    # Version of Nixos to interpret the files at.
    # Do not change this value unless you want to rewrite your config files.
    stateVersion = "23.11";
  };
}
