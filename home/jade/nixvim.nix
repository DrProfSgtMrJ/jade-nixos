
 { ... }:

 {
	programs.nixvim = {
		enable = true;
		colorschemes.catppuccin.enable = true;
		plugins = {
			lualine = {
				enable = true;
			};
			lsp = {
				enable = true;
				servers = {
					nixd.enable = true;
				};
			};
			telescope.enable = true;
			treesitter.enable = true;

			cmp = {
				enable = true;
				autoEnableSources = true;
				settings.sources = [
					{ name = "nvim_lsp"; }
					{ name = "path"; }
					{ name = "buffer"; }
				];
			};
		};
	};

 } 
