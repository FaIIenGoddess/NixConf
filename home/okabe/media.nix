{ pkgs, config, ... }:
{
  # media - control and enjoy audio/video
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
    imv # simple image viewer

    nvtop

    # video/audio tools
    cava # for visualizing audio
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo

    # processing audio/video
    ffmpeg-full

    #images
    viu
    imagemagick
    graphviz
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = true;
  };
}
