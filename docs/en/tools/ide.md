# VS Code IDE

Once Git and GitHub are configured, it's time to pick an editor that
integrates the whole workflow into a single window. There are many
excellent options:

- [Visual Studio Code](https://code.visualstudio.com/) (VS Code).
- [Neovim](https://neovim.io/) / [Vim](https://www.vim.org/) with
  plugins.
- [JetBrains IDEs](https://www.jetbrains.com/) (IntelliJ, PyCharm,
  WebStorm, etc.).
- [Sublime Text](https://www.sublimetext.com/).
- [Emacs](https://www.gnu.org/software/emacs/).

In this guide we use **VS Code** because:

- It's **free** and open source.
- It has **native Git integration** (no plugins required).
- It supports **Markdown** with live preview.
- It runs on **Windows, macOS, and Linux**.
- It has a huge ecosystem of extensions.

!!! note "If Vim is your thing"
    Vim and Neovim are still first-class tools, especially on
    remote servers and for people who live in the terminal. There
    are configurations like [LazyVim](https://www.lazyvim.org/)
    or [AstroNvim](https://astronvim.com/) that turn them into
    full IDEs. This guide doesn't cover them, but the choice is
    valid.

## 1. Installation

=== "Windows"

    1. Download the installer from
       [code.visualstudio.com/Download](https://code.visualstudio.com/Download).
    2. During installation, check these options:
       - **"Add to PATH"** (adds `code` to your PATH so you can use
         it from the terminal).
       - **"Add 'Open with Code' action"** (right-click in Explorer).
    3. When it finishes, open VS Code from the Start menu.

=== "macOS"

    With Homebrew:

    ```bash
    brew install --cask visual-studio-code
    ```

    Or download the `.dmg` from the official site.

=== "Linux"

    Debian/Ubuntu:

    ```bash
    sudo apt install ./code_1.85.0-1702772538_amd64.deb
    ```

    Fedora:

    ```bash
    sudo dnf install code
    ```

    Or from the [official site](https://code.visualstudio.com/Download)
    (`.deb`, `.rpm`, and tarball available).

## 2. Initial configuration

### Change the default shell

On Windows, the integrated terminal uses PowerShell by default. To
use Git Bash (more comfortable with Unix commands):

1. Open the Command Palette with ++ctrl+shift+p++.
2. Type `Terminal: Select Default Profile`.
3. Choose **Git Bash**.

On macOS and Linux, the system shell is already Unix and works
without changes.

### Theme

VS Code ships with light and dark themes. To change:

1. ++ctrl+k++ followed by ++ctrl+t++ (direct shortcut).
2. Pick from the preinstalled themes or install a new one (below).

### Font

For programmers, we recommend a font with *programming ligatures*:

1. Install [JetBrains Mono](https://www.jetbrains.com/lp/mono/) or
   [Fira Code](https://github.com/tonsky/FiraCode).
2. In VS Code: ++ctrl+comma++ (Settings).
3. Search for `font family` and set
   `'JetBrains Mono Ligatures', monospace`.

## 3. Git integration

VS Code ships with Git **integrated out of the box**. If you have
Git installed on your system, everything works without installing
anything extra.

### Source Control panel

The **Source Control** icon (the Git branch on the left sidebar)
opens a panel where you can:

- See modified, added, and deleted files.
- Stage changes (`+` button next to each file).
- Write a commit message and confirm.
- Push, pull, sync.
- See and resolve conflicts visually.

### Status bar

The status bar (bottom) shows:

- The current branch (e.g. `main`, `feature/login`).
- If there are pending changes (`↓` for pull, `↑` for push, `⇅` for
  both).
- The number of warnings and errors in the open file.

### Git Graph (recommended extension)

The
[Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
extension adds a visualization of the commit history with colors per
branch. It's very useful for understanding merges and rebases.

## 4. Recommended extensions

### Essential for Git/GitHub

| Extension | What it does |
|---|---|
| [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | Annotates each line with author and date of the last commit. |
| [GitHub Actions](https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions) | Highlighting and validation of YAML workflows. |
| [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) | Review and approve PRs without leaving the editor. |

### Essential for Markdown

| Extension | What it does |
|---|---|
| [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) | Keyboard shortcuts, automatic TOC, enhanced preview. |
| [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) | Real-time Markdown linter. |
| [Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid) | Native preview of Mermaid diagrams. |

### Essential for productivity

| Extension | What it does |
|---|---|
| [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens) | Inline errors and warnings in code. |
| [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager) | Manage multiple repositories as projects. |
| [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) | Sync your configuration across machines. |

!!! tip "Backup your configuration"
    In the cloud, VS Code automatically syncs your config if you
    sign in with GitHub (account icon, bottom left). It's the
    simplest way to have the same experience across all your
    machines.

## 5. Productive keyboard shortcuts

The most useful shortcuts for the Git/Markdown workflow:

| Action | Windows / Linux | macOS |
|---|---|---|
| Command Palette | ++ctrl+shift+p++ | ++cmd+shift+p++ |
| Quick open (find file) | ++ctrl+p++ | ++cmd+p++ |
| Settings | ++ctrl+comma++ | ++cmd+comma++ |
| Toggle terminal | ++ctrl+grave++ | ++ctrl+grave++ |
| Markdown preview | ++ctrl+k++ + ++v++ | ++cmd+k++ + ++v++ |
| Format document | ++shift+alt+f++ | ++shift+option+f++ |
| Multi-cursor | ++alt+click++ or ++ctrl+alt+down++ | ++option+click++ or ++cmd+option+down++ |
| Move line up/down | ++alt+up++ / ++alt+down++ | ++option+up++ / ++option+down++ |
| Comment line | ++ctrl+slash++ | ++cmd+slash++ |
| Go to definition | ++f12++ | ++f12++ |

!!! tip "Official cheat sheet"
    VS Code publishes a
    [cheat sheet PDF](https://code.visualstudio.com/docs/getstarted/keybindings#_keyboard-shortcuts-reference)
    with all shortcuts. Print it and keep it handy for the first
    few weeks.

## 6. Typical workflow

Let's see a real scenario: you're editing documentation, want to
commit the changes, and open a PR.

### Edit files

1. Open the project folder (`File → Open Folder` or `code .` in
   terminal).
2. Navigate the tree in the sidebar.
3. Edit the files. The **Source Control panel** shows modified
   files in real time.

### Review changes before committing

1. Click a modified file from Source Control.
2. VS Code opens an **inline diff view**: lines added in green,
   lines removed in red.
3. Verify the changes are correct.

### Commit

1. In Source Control, type the message.
2. ++ctrl+enter++ to confirm (or the ✓ button).
3. If `commit.gpgsign` is enabled, the commit is signed
   automatically (see
   [Signed commits with GPG](../git/gpg.md)).

### Push and Pull Request

1. After committing, a **"Sync Changes"** button appears in the
   status bar.
2. Click it and choose **Push**.
3. If you installed the *GitHub Pull Requests* extension, a
   **"Create Pull Request"** button appears that opens the GitHub
   web editor with the branch already selected.

## 7. Useful settings

Configure these options in `settings.json` (++ctrl+shift+p++ →
`Preferences: Open User Settings (JSON)`):

```json
{
    "editor.fontFamily": "'JetBrains Mono', 'Fira Code', monospace",
    "editor.fontLigatures": true,
    "editor.formatOnSave": true,
    "editor.tabSize": 2,
    "editor.minimap.enabled": false,
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.bracketPairs": true,
    "files.trimTrailingWhitespace": true,
    "files.insertFinalNewline": true,
    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    "terminal.integrated.fontFamily": "'JetBrains Mono', monospace",
    "markdown.preview.fontSize": 14,
    "markdownlint.config": {
        "MD013": false,
        "MD033": false
    }
}
```

!!! tip "Version your settings.json"
    Store your `settings.json` in a dotfiles repository or sync
    with
    [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync).
    That way you have the same experience on any machine.

## Next step

With the IDE configured, you can move on to
[Markdown syntax](markdown.md) to learn how to write the
documentation content, or jump to
[Practice](../practice/index.md) for full exercises.
