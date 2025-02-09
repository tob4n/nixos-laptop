{ config, pkgs, name, ... }: {

  system.stateVersion = "24.11";

  imports = [
    modules/core.nix
    modules/hardware.nix
    modules/gnome.nix
    modules/programs.nix
  ];

}
