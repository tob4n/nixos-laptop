{ ... }: {

  nixpkgs.hostPlatform = "x86_64-linux";
  
  time.timeZone = "America/Los_Angeles";
  
  networking.hostName = "laptop";
  
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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9a80ebfd-54d6-410d-a8c3-25fc3cc7c1dd";
    fsType = "ext4";
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/73f27c9f-b25c-4dff-b0dd-2c5260e98fe9"; }
  ];

}
