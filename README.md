# 💻 macOS Dotfiles

**My version-controlled shell, editor and terminal setup**

This repository tracks how my CLI environment has evolved. It started in Spring 2025 as a way to learn basic shell commands and has since become a small, reproducible setup that I keep under version control.

The current setup (late 2026) aims to be fast, simple and easy to understand. Several default command-line tools are swapped for modern alternatives.

## 🚀 Evolution & AI-Assisted Learning

My first setup used big pre-configured frameworks like Oh My Zsh and Powerlevel10k. They worked out of the box, but they got bloated, made the shell slow in ways that were hard to debug, and hid how the shell actually works.

So I dropped the frameworks and rebuilt everything from scratch. Over about 1.5 years I used LLMs as interactive guides, which helped me learn how the shell works underneath (for example, how `$PATH` decides which program runs) and build my own config instead of relying on plugins I didn't understand.

## 🏗️ Tools & Configuration

### Terminal & Shell
* **Terminal:** [Ghostty](https://mitchellh.com/ghostty) with the Catppuccin Mocha theme and `ctrl+h/j/k/l` to move between split panes.
* **Shell & Prompt:** `zsh` with the [starship](https://github.com/starship/starship) prompt, which shows Git status for the current repository.
* **Navigation:** [zoxide](https://github.com/ajeetdsouza/zoxide) jumps to directories by frecency: it ranks them by how often and how recently I've visited them.

### Modern CLI Replacements
Some default commands are aliased to modern alternatives:
* `ls` → [eza](https://github.com/eza-community/eza) (icons, a Git status column in `la`, and tree views via `tree` / `t2`–`t9`).
* `cat` → [bat](https://github.com/sharkdp/bat) (syntax highlighting and Git integration).

Also installed (used directly, not aliased): [fd](https://github.com/sharkdp/fd) as a faster `find`, [glow](https://github.com/charmbracelet/glow) for rendering Markdown, and `ouch` for compressing and extracting archives.

### Development & Version Control
* **Editor:** [helix](https://github.com/helix-editor/helix), set as `$EDITOR` and `$VISUAL`. Modal editing like Vim, without the configuration overhead.
* **Git:** `git pull` rebases instead of creating merge commits (`pull.rebase = true`), and uncommitted changes are stashed and restored automatically during a pull (`autoStash = true`).

## 🔒 Security & Best Practices

* **SSH:** `HashKnownHosts yes` stores hostnames in `~/.ssh/known_hosts` as hashes, so if the file leaks, nobody can read which servers I connect to. The GitHub `ed25519` key is loaded into the SSH agent and its passphrase is stored in the macOS Keychain.
* **Secret scanning:** [trufflehog](https://github.com/trufflesecurity/trufflehog) is installed via Brew so I can scan for leaked credentials manually.
* **Global Git Ignore:** `~/.gitignore-global` keeps `.env` files, `.pem`/`.key` certificates, SQLite databases and `.DS_Store` files out of every repository.
* **CI (GitHub Actions):** `security.yml` runs a TruffleHog scan on every push and pull request to `main`, on top of GitHub's built-in secret scanning, which is also enabled for this repository. I set it up with AI as a guide.


## 📦 Setup

All tools, including zsh itself, are installed with Homebrew.

To set up this environment on a new Mac:
```bash
# 1. Install Homebrew
# 2. Clone this repository
# 3. Install all packages, apps and extensions:
brew bundle install --file=brew/Brewfile

# 4. Create the symlinks:
DOTFILES=/path/to/dotfiles   # wherever you cloned it

ln -s $DOTFILES/zsh/zshrc               ~/.zshrc
ln -s $DOTFILES/zsh/aliases             ~/.zsh_aliases
ln -s $DOTFILES/git/gitconfig-global    ~/.gitconfig
ln -s $DOTFILES/git/gitignore-global    ~/.gitignore-global
ln -s $DOTFILES/ssh/ssh_config          ~/.ssh/config
ln -s $DOTFILES/ghostty/config          ~/.config/ghostty/config
ln -s $DOTFILES/helix/languages.toml    ~/.config/helix/languages.toml
```
