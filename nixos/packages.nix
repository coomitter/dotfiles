{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    curl wget
    file tree which
    bzip2 gzip zip unzip
    fish dash starship
    nnn htop rsync
    nixos-option home-manager

    # development programs
    clang lldb
    neovim  # don't forget the text editor!
    valgrind
    git gh 

    # X11 programs i use
    alacritty
    firefox
    dmenu xmobar feh
  ];

  environment.binsh = "${pkgs.dash}/bin/dash";
  environment.defaultPackages = lib.mkForce [];

  security.sudo.enable = false;
  security.doas.enable = true;

  security.doas.extraRules = [{
    users = [ ":wheel" ];
    keepEnv = true;
    persist = true;
  }];

  fonts.fonts = with pkgs; [
    nerdfonts
  ];
}
