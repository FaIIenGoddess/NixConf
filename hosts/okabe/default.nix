{ config, pkgs, home-manager, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../shared
    ../../modules/shared
    ../../modules/okabe
  ];
  nixpkgs.overlays = [
    (import ../../overlays/discord.nix)
    (import ../../overlays/electron.nix)
  ];

  # Networking
  networking.hostName = "okabe";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = true;

  boot = {
    # Kernel.
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "quiet" "splash" "udev.log_priority=3" "rd.udev.log_level=3" ];
    initrd.kernelModules = [ "amdgpu" ];

    # Silent Boot
    initrd.verbose = false;
    consoleLogLevel = 0;
    plymouth.enable = true;

    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "max";
      timeout = 8;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
  };

  systemd.watchdog.rebootTime = "0";

  # Hardware.
  hardware.opengl.enable = true;
  # Needed to make razer peripherals work.
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "alice" ];
  services.printing.enable = true;

  # MTP Devices
  services.gvfs.enable = true;
  programs.adb.enable = true;
}
