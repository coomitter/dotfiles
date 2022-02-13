# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # so that stuff like nvidia drivers will work
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./xconf.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "chonker"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 8080 ];

  # Set your time zone.
  time.timeZone = "America/Los-Angeles";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nix.extraOptions = ''
      experimental-features = nix-command flakes
  '';


  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stoopid = {
    isNormalUser = true;
    description = "damned fool";
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$6$Qjr1311mUhGXU8Ql$jbj2/vXW9D0gtLEOWbRTxLrr9JgHgZHJfTzPskFc23aqnx5CFnKS7JP7b.Phl.I5CT6t.qV9jdM20x3/pC8Nl.";
    shell = pkgs.fish;
  };

  system.stateVersion = "21.11"; # Did you read the comment?
}

