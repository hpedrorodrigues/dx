[![][github-action-badge]][github-action-dx]
[![][written-in-badge]][shell-code-dx]

# dx

**dx** is a command line tool to help you manage Docker resources faster with
interactive commands.

![Demo GIF][exec-gif]

## Installation

```bash
# Clone the project
$ git clone git@github.com:hpedrorodrigues/dx.git ~/.dx

# Add the directory to PATH

## Bash
$ echo 'export PATH="${HOME}/.dx:${PATH}"' >> "${HOME}/.bashrc"

## Zsh
$ echo 'export PATH="${HOME}/.dx:${PATH}"' >> "${HOME}/.zshenv"
```

> **Note**: For a better experience with this project it's recommended
> to install the [fuzzy finder][fzf] too.
>
> For this to work it must be available in your `PATH`.


[github-action-badge]: https://github.com/hpedrorodrigues/dx/workflows/DX%20Actions/badge.svg
[github-action-dx]: https://github.com/hpedrorodrigues/dx/actions

[written-in-badge]: https://img.shields.io/badge/Written%20in-bash-ff69b4.svg
[shell-code-dx]: https://github.com/hpedrorodrigues/dx/search?l=shell

[fzf]: https://github.com/junegunn/fzf

[exec-gif]: images/exec.gif
