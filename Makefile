all:
	@echo ""
	@echo "Please use one of the following targets:"
	@echo "    install"
	@echo "    clean"
	@echo ""


install:
	mkdir -p ~/.config
	mkdir -p ~/.local/share/nvim
	ln -vs $(PWD)/.config/nvim/ ~/.config/nvim
	ln -vs $(PWD)/.local/share/nvim/site/ ~/.local/share/nvim/site

clean:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim/site
