eval "$(zoxide init zsh)"

zvm_after_init() {
  zvm_bindkey viins '^Y' autosuggest-accept
}

# Google Cloud SDK
if [ -f "$HOME/.local/share/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/.local/share/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/.local/share/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/.local/share/google-cloud-sdk/completion.zsh.inc"
fi
