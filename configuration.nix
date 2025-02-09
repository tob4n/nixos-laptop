{ config, pkgs, name, ... }: {
  
  imports = [
    ../modules/core.nix
    ../modules/hardware.nix
    ../modules/gnome.nix
    ../modules/programs.nix
  ];

}
