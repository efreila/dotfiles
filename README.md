# github.com/efreila/dotfiles

dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Install

Install XCode Developer tools:

```shell
xcode-select --install
```

Run the installation script:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/efreila/dotfiles/HEAD/install.sh)"
```

This will install Homebrew, Oh My Zsh, and Chezmoi. Running this installation script will also cause the scripts in [.chezmoiscripts](https://github.com/efreila/dotfiles/tree/main/.chezmoiscripts) to run.