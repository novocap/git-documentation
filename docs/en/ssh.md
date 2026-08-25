# SSH Connection with GitHub

To authenticate against [GitHub](https://github.com) (or
[GitLab](https://gitlab.com) and [Bitbucket](https://bitbucket.org))
you can use two mechanisms:

- **HTTPS** with username/password or a Personal Access Token (PAT).
- **SSH** with a public/private key pair.

In this guide we use **SSH** because:

- It avoids typing credentials on every `push`/`pull`.
- It allows multiple identities on the same machine.
- It's an industry standard and works with any server.

!!! warning "Be careful with shared machines"
    Generate SSH keys **only on machines you trust**. In internet
    cafés, hotel PCs, or on public networks, prefer HTTPS with a
    rotating PAT or one-time authentication.

## 1. Why Ed25519

There are several algorithms to generate SSH keys. We recommend
**Ed25519** because:

- It's faster than RSA.
- The keys are shorter (easier to handle).
- It has better resistance to quantum factorization algorithms.

!!! info "Compatibility"
    Ed25519 is supported by GitHub since 2017, OpenSSH since 6.5
    (2014), and PuTTY since 0.68 (2017). If you need compatibility
    with very old systems, you can use RSA 4096, but Ed25519 is the
    modern choice.

## 2. Generate the SSH key

Open your terminal and run:

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Git responds:

```text
Generating public/private ed25519 key pair.
Enter a file in which to save the key (~/.ssh/id_ed25519): [Enter]
```

Press **Enter** to use the default location. If you already have a
key there, **don't overwrite it**: use a different name (for example
`~/.ssh/id_ed25519_github`).

Then it asks for a passphrase:

```text
Enter passphrase (empty for no passphrase): [your passphrase]
Enter same passphrase again: [repeat it]
```

!!! tip "Passphrase, not password"
    An empty passphrase lets you use the key without unlocking it,
    but if someone gains access to your file they can impersonate
    you. With a passphrase, each use requires you to enter it (or
    that the `ssh-agent` unlocks it once per session).

!!! warning "If you already have an active SSH key"
    Before generating a new one, list the ones that already exist:

    ```bash
    ls -la ~/.ssh
    ```

    If you have an `id_ed25519` or `id_rsa` that you remember is
    uploaded to GitHub, you can skip this section and go to the
    next one.

## 3. Add the key to the ssh-agent

The `ssh-agent` is a background process that stores unlocked keys
for the duration of your session. For your key to work
"automagically", you need to:

=== "macOS"

    macOS ships with an integrated `ssh-agent`. Just add the key:

    ```bash
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    ```

    The `--apple-use-keychain` flag stores the passphrase in the
    system **Keychain**, so it doesn't prompt you on each use.

=== "Linux"

    Start the agent and add the key:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

    To make the agent start automatically when you open a terminal,
    add those lines to your `~/.bashrc` or `~/.zshrc`.

=== "Windows (Git Bash)"

    Start the agent:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

    To make Git Bash find the agent in future sessions, add those
    lines to your `~/.bashrc`.

!!! tip "Verify the loaded keys"
    On any system:

    ```bash
    ssh-add -l
    ```

    Lists all keys that the agent has unlocked.

## 4. Upload the public key to GitHub

First, copy the content of your **public key** (not the private one):

=== "macOS"

    ```bash
    pbcopy < ~/.ssh/id_ed25519.pub
    ```

=== "Linux"

    ```bash
    xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    ```

    If you don't have `xclip`:

    ```bash
    sudo apt install xclip
    ```

=== "Windows (Git Bash)"

    ```bash
    clip < ~/.ssh/id_ed25519.pub
    ```

=== "Any system"

    If you prefer not to use the clipboard, open the file in your
    editor and copy all its content (including the
    `your.email@example.com` comment at the end).

Then go to GitHub:

1. Go to [github.com/settings/ssh/new](https://github.com/settings/ssh/new).
2. **Title**: a descriptive name (for example "MacBook Pro personal",
   "Office PC").
3. **Key type**: *Authentication Key*.
4. **Key**: paste the content of your public key.
5. Click **Add SSH key**.
6. If it asks you to confirm, enter your GitHub password.

!!! warning "Clean the clipboard"
    After pasting the public key on GitHub, copy any other text to
    the clipboard to prevent the key from being exposed if you
    accidentally paste somewhere else.

## 5. Test the connection

To verify everything works:

```bash
ssh -T git@github.com
```

The first time you connect to the server, Git asks if you trust the
host's fingerprint:

```text
The authenticity of host 'github.com (140.82.121.4)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Type `yes`. If everything is fine, you'll see:

```text
Hi <your-username>! You've successfully authenticated, but GitHub does not provide shell access.
```

!!! tip "The shell access warning is normal"
    GitHub authenticated you but doesn't give you SSH access to the
    server (it's not an interactive server). The message is part of
    the correct flow.

If you see `Permission denied (publickey)`, go back to the previous
sections and verify that:

- The file in `~/.ssh/` is the **public** one (ends in `.pub`).
- You uploaded it to GitHub correctly.
- The `ssh-agent` has the private key loaded (`ssh-add -l`).

## 6. Switch from HTTPS to SSH

If you already have repositories cloned via HTTPS and want to switch
them to SSH, just change the remote:

```bash
git remote set-url origin git@github.com:novocap/git-documentation.git
```

To verify:

```bash
git remote -v
```

You should see:

```text
origin  git@github.com:novocap/git-documentation.git (fetch)
origin  git@github.com:novocap/git-documentation.git (push)
```

## 7. Multiple accounts (advanced)

If you need to authenticate with different keys against the same
platform (for example, your personal account and your company's),
configure a block in `~/.ssh/config`:

```sshconfig
# Personal account
Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Company account
Host github.com-company
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_company
```

Then, in the repository:

```bash
git remote set-url origin git@github.com-personal:your-username/project.git
```

!!! tip "`IncludeIf` for conditional config"
    If you work with many different repositories, you can use
    `IncludeIf` to load different configs based on the directory.
    More info in the
    [official OpenSSH documentation](https://man.openbsd.org/ssh_config#IncludeIf).

## Next step

With SSH configured, you can move on to
[Git and GitHub Fundamentals](git/index.md) to learn the workflow
with `git add`, `git commit`, branches, and Pull Requests.
