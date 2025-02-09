{ pkgs, ... }: {
  
  environment.systemPackages = with pkgs; [
    # Miscellaneous
    appimage-run

    # Developer tools
    jdk21
    python3
    vscodium
    jetbrains.idea-ultimate
    android-tools
  
    # Main desktop apps
    librewolf          # Browser
    blackbox-terminal  # Terminal
    nautilus           # File explorer
    file-roller        # Archive explorer
    gnome-text-editor  # Text editor
    gnome-disk-utility # Disk utility
    mission-center     # Process manager
    loupe              # Image viewer
    celluloid          # Video player
    fragments          # Torrenting client
    bottles            # Wine manager 
    ghex               # Hex editor
    
  ];

}
