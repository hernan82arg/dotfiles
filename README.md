# dotfiles

Install ASDF

brew install asdf

Run `cut -d ' ' -f1 .tool-versions | while read plugin; do asdf plugin add "$plugin"; done` to add ASDF plugins

Install windsor:

```
brew install windsor
brew install --cask windsor
```

Install git prompt

brew install zsh-git-prompt

Install pinentry-touchid

brew tap jorgelbg/tap
brew install pinentry-touchid

Install GPG

brew install gpg gawk

Install WARP

brew install --cask warp

Install 1p cli

brew install --cask 1password-cli
