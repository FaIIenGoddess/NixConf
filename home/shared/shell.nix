{ config, ... }:
let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in rec {
  # add system variables
  systemd.user.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";

    # set default applications
    BROWSER = "firefox";
    TERM = "kitty";
    EDITOR = "vim";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";
  };

  home.sessionVariables = systemd.user.sessionVariables;
}
