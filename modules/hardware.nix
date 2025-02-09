{ ... }: {

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

  # Enable CUPS for printing
  services.printing.enable = true;

  # Configure network
  networking = {
    hostName = "laptop";
    useDHCP = true;
  };

  # Configure bootloader
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
    };
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
    device = "/dev/disk/by-uuid/9a80ebfd-54d6-410d-a8c3-25fc3cc7c1dd";
    fsType = "ext4";
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/73f27c9f-b25c-4dff-b0dd-2c5260e98fe9"; }
  ];

}
