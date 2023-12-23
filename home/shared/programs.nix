{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nmon
    iotop
    iftop

    # compare to each other to see with is better to me and preffered
    nnn # cli file explorer
    ranger # cli file explorer

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    eza
    fzf

    # misc
    libnotify
    cowsay
    figlet
    cbonsai
    cmatrix
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    pfetch
    neofetch

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    tcpdump # network sniffer
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for 'sensors' command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    hdparm # for disk performance, command
    dmidecode # a tool that reads info about your system's hardware from BIOS according to the SMBIOS/DMI standard
  ];

  # auto-mount usb drives
  services = {
    udiskie.enable = true;
  };
}
