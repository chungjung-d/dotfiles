export PATH="$HOME/.local/bin:$PATH"


# Oh My Zsh theme (disabled when Starship is active)
ZSH_THEME=""

#BREW
export PATH="/opt/homebrew/bin:$PATH"

#ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit


# CURSOR CLI
export PATH="$HOME/.local/bin:$PATH"


eval "$(direnv hook zsh)"




#alias (cursor)
alias ca='cursor-agent'
alias c='cursor'


# Kitty shell integration (prompt/cursor/cwd tracking)
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  if [[ -f "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh" ]]; then
    source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh"
  fi
elif [[ -f "/Applications/kitty.app/Contents/Resources/shell-integration/zsh/kitty.zsh" ]]; then
  source "/Applications/kitty.app/Contents/Resources/shell-integration/zsh/kitty.zsh"
fi

# Zsh plugin manager: zinit (fast, feature-rich)
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  mkdir -p "$HOME/.local/share/zinit" && \
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# Ensure completions pick up plugins added to $fpath
autoload -Uz compinit && compinit -u

# fzf keybindings/completion (if installed)
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# zoxide (smarter cd) if installed
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Starship prompt (pretty prompt with icons/colors)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
