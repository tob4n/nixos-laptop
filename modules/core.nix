  # Setup EFI boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable NetworkManager
  networking.networkmanager.enable = true;

  # Create user account with sudo and network access
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Disable documentation and xterm apps
  documentation.nixos.enable = false;

  services.xserver.excludePackages = [ pkgs.xterm ];

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # Apply home configs
  system.activationScripts.apply_dotfiles = "cp -a /etc/nixos/hosts/${name}/home/. /home/user/";

  # Install git and update command
  environment.systemPackages = with pkgs; [
    git
    (pkgs.writeShellScriptBin "nixos-config-update" ''
      #!${pkgs.bash}/bin/bash
      set -e
      cd /etc/nixos
      sudo find . -mindepth 1 -delete
      sudo git clone https://github.com/tob4n/nixos-laptop .
      sudo nixos-rebuild switch
    '')
  ];
