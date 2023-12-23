{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      iosevka
      font-awesome
      powerline-fonts
      ubuntu_font_family
    ];

    fontconfig.defaultFonts = {
      serif = [ "Ubuntu" ];
      sansSerif = [ "Ubuntu" ];
      monospace = [ "Iosevka" "Ubuntu" ];
    };
  };
}
