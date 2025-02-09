{ config, lib, pkgs, ... }: {
  
  # Enable GNOME
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable XDG desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  # Disable GNOME core apps and setup
  services.gnome = {
    core-utilities.enable = false;
    gnome-initial-setup.enable = false;
  };

  # Disable remaining GNOME apps
  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.gnome-shell-extensions
  ];

}

}
