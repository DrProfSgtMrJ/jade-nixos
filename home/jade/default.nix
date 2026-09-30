 { config, pkgs, ... }:
 {
   imports = [
	./shell.nix
	./nixvim.nix
   ];
   home.username = "jade";
   home.homeDirectory = "/home/jade";

   xresources.properties = {
     "Xcursor.size" = 16;
     "Xft.dpi" = 172;
   };

   home.packages = with pkgs; [
     nnn

     zip
     xz
     unzip
     p7zip
     
     fzf

     which
     tree

     
     nix-output-monitor

     btop
     iftop
     lsof

     nixd

     
   ];

   programs.git = {
      enable = true;
      userName = "DrProfSgtMrJ";
      userEmail = "bacon388@gmail.com";
   };

   home.stateVersion = "26.05";

 }
