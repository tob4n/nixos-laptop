{ lib, pkgs, ... }: {

  # Set platform type
  nixpkgs.hostPlatform = "x86_64-linux";

  # Set time zone
  time.timeZone = "America/Los_Angeles";

  # Enable pipewire for audio
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Configure network
  networking = {
    hostName = "laptop";
    useDHCP = lib.mkDefault true;
  };

  # Configure bootloader and kernel
  boot = {
    loader.grub = {
      enable = true;
      useOSProber = true;
      device = "/dev/sda";
    };
    kernelPackages = pkgs.linuxPackages_latest; 
    kernelModules = [ "kvm-intel" ];
    initrd.availableKernelModules = [
      "xhci_pci"
      "ehci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "sdhci_pci"
    ];
  };

  # Configure file system
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  swapDevices = [ 
    { device = "/dev/sda2"; }
  ];

}
