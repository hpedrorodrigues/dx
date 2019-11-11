[![][github-action-badge]][github-action-dx]
[![][written-in-badge]][shell-code-dx]

# dx

**dx** is a command line tool to help you manage Docker resources faster with
interactive commands.

## Usage

```
dx

Here you can find commands to help you manage Docker resources faster
---
Usage:
  dx ls                         : List all resources
  dx exec                       : Execute custom commands in a running container
  dx logs                       : Show the logs of a container
  dx inspect                    : Return low-level information on objects
  dx delete                     : Remove one or more resources     [confirmation required]
  dx clear <resource_filter>    : Remove resources using a filter  [confirmation required]
     |> containers                - Remove ALL containers
     |> images                    - Remove images not used by any containers
     |> volumes                   - Remove volumes not referenced by any containers
     |> networks                  - Remove networks that has not being used
     |> all                       - Remove ALL resources
     |> dirt                      - Remove resources that has not being used

  dx --help                     : Show this message
```

- Interactive menu with fuzzy searching ([with fuzzy finder][fzf])
![Demo Interactive GIF][exec-interactive-gif]

- Interactive menu ([with the construct select][select])
![Demo Non Interactive GIF][exec-gif]

## Installation

Clone this repository to any directory and add it to `PATH`.

```bash
git clone --depth 1 git@github.com:hpedrorodrigues/dx.git ~/.dx


# Bash
echo 'export PATH="${HOME}/.dx:${PATH}"' >> "${HOME}/.bashrc"

## or

# Zsh
echo 'export PATH="${HOME}/.dx:${PATH}"' >> "${HOME}/.zshenv"
```

> **Note**: To use the interactive menu with fuzzy searching you need to install
> the [fuzzy finder][fzf] too.
>
> For this to work it must be available in your `PATH`.

### Completion

**dx** provides shell completion to complete supported commands while typing.

If you want to add the Bash completion, add the following to your `.bashrc` or `.zshenv`.

```bash
[ -f "${HOME}/.dx/completion/dx.bash" ] && source "${HOME}/.dx/completion/dx.bash"
```


[github-action-badge]: https://github.com/hpedrorodrigues/dx/workflows/DX%20Actions/badge.svg
[github-action-dx]: https://github.com/hpedrorodrigues/dx/actions

[written-in-badge]: https://img.shields.io/badge/Written%20in-bash-ff69b4.svg
[shell-code-dx]: https://github.com/hpedrorodrigues/dx/search?l=shell

[fzf]: https://github.com/junegunn/fzf
[select]: https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs

[exec-gif]: images/exec.gif
[exec-interactive-gif]: images/exec-interactive.gif
