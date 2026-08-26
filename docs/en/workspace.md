# Workspace

Before you start working with Git, let's get your environment ready. In
this chapter we install the binary, configure your identity, and
verify that everything works.

## 1. Install Git

The first step is to install the Git binary on the operating system
you use. The simplest way is to download the official installer from
the [download site](https://git-scm.com/download).

=== "Windows"

    1. Download the `.exe` installer from
       [git-scm.com/download/win](https://git-scm.com/download/win).
    2. Run the installer. The default options are good enough for most
       cases; pay attention to these two:
       - **"Adjusting your PATH environment"**: leave the option
         *"Git from the command line and also from 3rd-party software"*.
         This makes Git accessible from `cmd`, PowerShell, and other
         terminals.
       - **"Choosing the default terminal editor"**: leave *Vim* or
         switch to your preferred editor.
    3. When it finishes, open **Git Bash** from the Start menu. It's
       the terminal we'll use throughout the guide for Git commands
       on Windows.

=== "macOS"

    On macOS you can install Git in two ways:

    - **Xcode Command Line Tools** (includes Git):

      ```bash
      xcode-select --install
      ```

    - **Homebrew** (recommended for keeping it updated):

      ```bash
      brew install git
      ```

=== "Linux"

    On Debian/Ubuntu:

    ```bash
    sudo apt update
    sudo apt install git
    ```

    On Fedora:

    ```bash
    sudo dnf install git
    ```

    On Arch:

    ```bash
    sudo pacman -S git
    ```

!!! tip "Windows users: Git Bash is not WSL"
    **Git Bash** is a minimal layer that Git for Windows ships with,
    plus a Unix-style shell (based on MSYS2). It is not the same as
    [WSL](https://learn.microsoft.com/en-us/windows/wsl/) (Windows
    Subsystem for Linux). If you already use WSL, you can install Git
    inside your Linux distro as on any Unix system.

## 2. Verify the installation

Once installed, open your terminal and check the version:

```bash
git --version
```

You should see something like:

```text
git version 2.43.0
```

If the command is not recognized, check that your PATH includes the
Git installation directory (on Windows this is usually
`C:\Program Files\Git\cmd`).

## 3. Configure your identity

Git needs to know who you are to record authorship for each change.
This information is included in every `commit` you make, so it's
important to configure it **just once**.

### Name and email

```bash
git config --global user.name "Your Name Surname"
git config --global user.email "your.email@example.com"
```

!!! warning "Use the same email as on GitHub"
    If you want GitHub to display your commits as verified and linked
    to your profile, `user.email` must match the email of your
    account. For multiple emails, you can add aliases on GitHub from
    [Settings → Emails](https://github.com/settings/emails).

### Default editor

Git opens an editor when it needs you to write a longer message (for
example, in `git commit` without `-m`). The default is usually `vim`,
which is not friendly for beginners. We recommend changing it.

=== "VS Code"

    ```bash
    git config --global core.editor "code --wait"
    ```

    Requires the [`code` extension in your PATH](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).

=== "Sublime Text"

    ```bash
    git config --global core.editor "subl --wait"
    ```

=== "Nano"

    ```bash
    git config --global core.editor "nano"
    ```

=== "Vim (default)"

    No need to configure it; it's already Git's default editor. If
    Vim feels unfamiliar, open it and type `:q!` to quit without
    saving.

### Default branch name

Since Git 2.28 you can set the name of the initial branch when you
create a new repository:

```bash
git config --global init.defaultBranch main
```

!!! info "Default branch: `main`"
    Throughout this guide we use `main` as the default branch, which
    is the standard name adopted by GitHub, GitLab, and other platforms
    since 2020.

### Other useful configurations

```bash
# Enable color highlighting in terminals that support it
git config --global color.ui auto

# Enable autocorrect for common typos in commands
git config --global help.autocorrect 10

# Set the default diff tool
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
```

## 4. Verify the configuration

To see all the options you've configured:

```bash
git config --global --list
```

You'll see something like:

```text
user.name=Your Name Surname
user.email=your.email@example.com
core.editor=code --wait
init.defaultBranch=main
color.ui=auto
help.autocorrect=10
```

## 5. Three configuration levels

Git supports three configuration levels. It's important to understand
when to use each one:

| Level | Command | Scope | File |
|---|---|---|---|
| `--local` (default) | `git config user.name "X"` | This repository only | `.git/config` |
| `--global` | `git config --global user.name "X"` | Your user on this system | `~/.gitconfig` |
| `--system` | `git config --system user.name "X"` | All users (Linux/macOS) | `/etc/gitconfig` |

!!! tip "See where each option comes from"
    `git config --show-origin --get user.name` tells you which file
    provides each value. It's very useful when a configuration
    doesn't behave as expected.

## Next step

With Git installed and configured, you can move on to
[SSH Connection with GitHub](ssh.md) to authenticate securely
against your remote repositories.
