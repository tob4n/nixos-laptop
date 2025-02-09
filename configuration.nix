{ config, pkgs, name, ... }: {

  system.stateVersion = "25.05";

  imports = [
    ../modules/core.nix
    ../modules/hardware.nix
    ../modules/gnome.nix
    ../modules/programs.nix
  ];

}
