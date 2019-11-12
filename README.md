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

- Interactive menu with fuzzy searching ([fuzzy finder][fzf])

![Demo Interactive GIF][exec-interactive-gif]


- Interactive menu ([conditional construct select][select])

![Demo Non Interactive GIF][exec-gif]

## Installation

### Using Homebrew or Linuxbrew

You can use [Homebrew][homebrew] or [Linuxbrew][linuxbrew] to install **dx**.

```bash
brew tap hpedrorodrigues/dx https://github.com/hpedrorodrigues/dx.git
brew install dx
```

> **Note**: It will also set up the completions (Bash and Zsh).
>
> If you want the interactive menu with fuzzy searching you need to install the
> [fuzzy finder][fzf] too.

### Using git

Clone this repository to any directory and add it to `PATH`.

```bash
git clone --depth 1 git@github.com:hpedrorodrigues/dx.git ~/.dx

## Add the directory to PATH in your ~/.bashrc or ~/.zshenv
export DX_HOME="${HOME}/.dx" \
  && [ -d "${DX_HOME}" ] \
  && export PATH="${DX_HOME}:${PATH}"
```

> **Note**: To use the interactive menu with fuzzy searching you need to install
> the [fuzzy finder][fzf] too.
>
> For this to work it must be available in your `PATH`.

#### Completion

**dx** provides shell completion to complete commands while typing.

##### Bash

If you want to add the Bash completion, add the following to your `.bashrc`.

```bash
[ -f "${HOME}/.dx/completion/dx.bash" ] && source "${HOME}/.dx/completion/dx.bash"
```

##### Zsh

If you want to add the Zsh completion, add the directory to your `$fpath`
in `.zshenv`.

```bash
fpath=("${HOME}/.dx/completion" $fpath)
```

> **Note**: If it doesn't work, add `autoload -U compinit && compinit` to your
> `.zshenv` after the `$fpath` been set.
>
> You may have to force rebuild the zcompdump with `rm -f ~/.zcompdump && compinit`.


[github-action-badge]: https://github.com/hpedrorodrigues/dx/workflows/DX%20Checks/badge.svg
[github-action-dx]: https://github.com/hpedrorodrigues/dx/actions

[written-in-badge]: https://img.shields.io/badge/Written%20in-bash-ff69b4.svg
[shell-code-dx]: https://github.com/hpedrorodrigues/dx/search?l=shell

[fzf]: https://github.com/junegunn/fzf
[select]: https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs

[exec-gif]: images/exec.gif
[exec-interactive-gif]: images/exec-interactive.gif

[homebrew]: https://brew.sh
[linuxbrew]: http://linuxbrew.sh
