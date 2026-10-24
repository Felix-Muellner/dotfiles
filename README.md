# 💻 macOS Dotfiles & Environment Architecture

**Minimalist, Version-Controlled System Configuration & Developer Environment**

This repository tracks the evolution of my personal CLI environment and system architecture. What began as an exploration of basic shell commands in Spring 2025 has been systematically refactored into a lean, reproducible, and version-controlled configuration. 

The current architecture (as of late 2026) prioritizes speed, security, and reduced cognitive load by replacing legacy POSIX utilities with modern, optimized alternatives.

## 🚀 Evolution & AI-Assisted Learning

My initial environment relied on massive, pre-configured frameworks like Oh My Zsh and Powerlevel10k. While functional out of the box, they quickly became bloated, introduced difficult-to-debug latency issues, and ultimately obscured how the shell actually worked. 

To resolve this, I abandoned the frameworks and rebuilt my environment entirely from scratch. Throughout this 1.5-year process, I heavily utilized LLMs as interactive technical guides. This allowed me to rapidly learn underlying POSIX mechanics, deeply understand `$PATH` execution priorities, and architect a custom system instead of relying on black-box plugins.

## 🏗️ Core Architecture & Tooling

### Terminal & Shell Environment
* **Terminal Emulator:** [Ghostty](https://mitchellh.com/ghostty) – Configured with a Catppuccin Mocha theme and custom split-pane multiplexing (`ctrl+h/j/k/l`) for rapid navigation.
* **Shell & Prompt:** `zsh` initialized with the cross-shell [starship](https://github.com/starship/starship) prompt engine for contextual repository status.
* **Navigation:** [zoxide](https://github.com/ajeetdsouza/zoxide) integrated directly into the shell for smart, algorithm-based directory jumping.

### Modern CLI Replacements (Rust-based)
To improve performance and developer experience, standard GNU utilities are aliased to modern alternatives:
* `ls` → [eza](https://github.com/eza-community/eza) (Configured with automated icons, git status integration, and nested tree views).
* `cat` → [bat](https://github.com/sharkdp/bat) (Syntax highlighting and Git integration).
* `find` → [fd](https://github.com/sharkdp/fd) (Fast, user-friendly alternative).
* Markdown rendering via [glow](https://github.com/charmbracelet/glow) and archive management via `ouch`.

### Development & Version Control
* **Primary Editor:** [helix](https://github.com/helix-editor/helix) (Set globally as `$EDITOR` and `$VISUAL`), leveraging modal editing without the configuration overhead of traditional Vim.
* **Git Workflow:** Configured for strict linear history (`pull.rebase = true` and `autoStash = true`). 
* **Development Environments:** Automated pathing, runtime resolution, and package management configured to dynamically support diverse language ecosystems and tech stacks.

## 🔒 Security & Best Practices

A major focus of this configuration is enforcing strict security and hygiene baselines across the operating system:
* **SSH Hardening:** Strict `HashKnownHosts yes` enforced in the `.ssh/config` to mitigate tracking and spoofing, with automated Apple Keychain integration for GitHub `ed25519` identity keys.
* **Credential Protection:** [trufflehog](https://github.com/trufflesecurity/trufflehog) installed via Brew for finding and verifying exposed credentials before commits.
* **Global Git Ignore:** A comprehensive `~/.gitignore-global` blocking the accidental upload of `.env` files, `.pem`/`.key` certificates, SQLite databases, and OS-level `.DS_Store` junk.
* **CI/CD & Automated Security (GitHub Actions):** To enforce credential hygiene beyond the local environment, I implemented a foundational CI/CD pipeline. Using AI as a technical guide, I configured a `security.yml` action that runs a remote TruffleHog scan on pushes and pull requests to the `main` branch. This acts as a post-push auditing layer that complements GitHub's native secret scanning features, which I have also actively enabled for this public repository.


## 📦 Deployment & Bootstrapping

System dependencies & binaries including zsh itself are strictly managed and automated via `Homebrew`. 

To replicate this environment:
```bash
# 1. Install Homebrew
# 2. Clone this repository
# 3. Restore all binaries, Casks, etc.:
brew bundle install --file=Brewfile

# 4. Create symlinks for zshrc, gitconfig etc...
# example: make sure you are in ~/
ln -s ~/PathToRepository/dotfiles/zsh/zshrc .zshrc
```
