
 { pkgs, ... }:

 {
	home.packages = with pkgs; [
		devenv
		direnv
	];
	programs.direnv = {
		enable = true;
		nix-direnv.enable = true;
	};
	programs.kitty = {
		enable = true;
		settings = {
			font_size = 12;
			confirm_os_window_close = 0;
			enable_audio_bell = false;
			shell = "${pkgs.zsh}/bin/zsh";
		};

		shellIntegration = {
			enableZshIntegration = true;
		};
		theme = "Catppuccin-Mocha";	
			
	};

	programs.zsh = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/nixos#jade";
		};
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [
				"git"
				"python"
			];
		};
		initExtra=''
		  eval "$(direnv hook zsh)"
		'';
	};
	programs.atuin = {
		enable = true;
	};
 }
