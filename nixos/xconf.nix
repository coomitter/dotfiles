{ config, pkgs, ... }:

{
  services.xserver = { 
    enable = true;
    videoDrivers = [ "nvidia" ];
    windowManager.xmonad = {
      enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages : [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
    };
    desktopManager.xterm.enable = false; # screw you xterm
    layout = "us";
  };
  hardware.opengl.driSupport32Bit = true;
  qt5.enable = true;
  qt5.platformTheme = "gtk2";
  qt5.style = "gtk2";
}
