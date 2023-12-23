{ username, ... }:
{
  nix.settings.trusted-users = ["alice"];

  users.groups = {
    alice = {};
    wireshark = {};
  };
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.alice = {
    home = "/home/alice";
    isNormalUser = true;
    description = "alice";
    extraGroups = [
      "alice"
      "users"
      "networkmanager"
      "wheel"
      "wireshark"
      "adbusers"
      "libvirtd"
    ];
  };
  # Disable sudo password for user.
  security.sudo.wheelNeedsPassword = false;
}
