Dotfiles for macOS (kitty + zsh + starship)

Install

```bash
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Overwrite existing files

```bash
FORCE=1 ./install.sh
```

Includes
- ~/.config/kitty (kitty.conf, dracula.conf)
- ~/.config/starship.toml
- ~/.zshrc (zinit plugin manager, starship, kitty integration)

Optional
- If you have a Brewfile, place it here and run `brew bundle` automatically via install.sh
