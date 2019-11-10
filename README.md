[![][github-action-badge]][github-action-dx]
[![][written-in-badge]][shell-code-dx]

# dx

**dx** is a command line tool to help manage Docker resources faster.

## Installation

You can install **dx** in two ways:

- Using the script [install](./install) (the recommended way):

```bash
# cURL
bash <(curl 'https://raw.githubusercontent.com/hpedrorodrigues/dx/master/install')

# Wget
bash <(wget -qO- 'https://raw.githubusercontent.com/hpedrorodrigues/dx/master/install')
```

- Or you can install **dx** manually:

```bash
git clone git@github.com:hpedrorodrigues/dx.git ~/.dx

echo 'export PATH="${HOME}/.dx:${PATH}"' >> "${HOME}/.bashrc"
```

> **Note**: For a better experience with the interactive mode it's recommended to
> install the [command-line fuzzy finder][fzf] too.
>
> For this to work it must be available in your `PATH`.


[github-action-badge]: https://github.com/hpedrorodrigues/dx/workflows/DX%20Actions/badge.svg
[github-action-dx]: https://github.com/hpedrorodrigues/dx/actions

[written-in-badge]: https://img.shields.io/badge/Written%20in-bash-ff69b4.svg
[shell-code-dx]: https://github.com/hpedrorodrigues/dx/search?l=shell

[fzf]: https://github.com/junegunn/fzf
