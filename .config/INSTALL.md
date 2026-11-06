# INSTALL.md – System Recovery Notes

Snapshot generated 2026-11-06 on Ubuntu 26.04 (resolute), shell: **fish**.
Dotfiles are managed with `yadm` (restore: `yadm clone https://github.com/012e/dotfiles-linux.git`), `~/.config/nvim` is its own repo.

## 0. Order of operations
1. `apt` base + PPAs → 2. Rust (rustup) → 3. uv, mise, Go (snap) → 4. cargo tools → 5. uv tools → 6. npm globals → 7. snap/flatpak apps → 8. manual binaries → 9. clone repos.

## 1. APT

### Extra repositories / PPAs
```sh
sudo add-apt-repository ppa:fish-shell/release-4
sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
# Google Chrome: https://dl.google.com/linux/chrome-stable/deb/ stable
# albert (home:manuelschneid3r): http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_24.04/
# TeamViewer: teamviewer.list
# Disabled (re-enable if needed): docker, cloudflare-client (warp), github-cli, wezterm
```

### Manually installed packages
```sh
sudo apt install \
  7zip 7zip-rar bluedevil blueman bluetooth btop btrfs-progs bubblewrap build-essential \
  chntpw clang clang-format cloudflare-warp containerd.io copyq curl direnv \
  docker-buildx-plugin docker-ce docker-ce-cli docker-ce-rootless-extras docker-compose-plugin docker-model-plugin \
  dolphin dotnet-sdk-10.0 dtrx dunst efibootmgr espeak-ng fd-find feh fish findutils flameshot flatpak foliate fzf \
  gcc gh git git-butler git-lfs google-chrome-stable gparted graphviz htop httpie hyperfine ibus ibus-bamboo \
  imagemagick jq kde-plasma-desktop ksnip libdbus-1-dev libfontconfig1-dev libfreetype-dev libfuse2t64 libnotify-bin \
  libssl-dev libx11-dev libxft-dev libxinerama-dev love lxappearance magic make meson mpv mupdf nala ncal \
  openjdk-17-jre-headless pamixer pandoc parallel patool pdfgrep picom postgresql-client python-is-python3 \
  python3-netifaces qalc qbittorrent rofi sioyek sqlite3 sway teamviewer television tesseract-ocr tesseract-ocr-vie \
  tmux trash-cli tree ttf-mscorefonts-installer ubuntu-restricted-addons unrar wmctrl xclip xpdf xserver-xephyr \
  xubuntu-desktop-minimal yadm zathura zathura-cb zathura-pdf-poppler zbar-tools zoom wezterm
```
> `wezterm`, `zoom`, `teamviewer`, `cloudflare-warp`, `docker-*`, `gh` come from vendor repos/debs – add their repos first.

## 2. Rust (rustup) and cargo tools
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup toolchain install nightly
rustup component add rust-analyzer clippy rustfmt miri   # as needed
cargo install cargo-binstall          # then use `cargo binstall` for speed
```

### Crates installed (`cargo install --list`)
| Tool | Crate | Purpose |
|---|---|---|
| bat | `bat` | cat with syntax highlight |
| eza | `eza` | ls replacement |
| fd | `fd-find` | find replacement |
| rg | `ripgrep` | grep replacement |
| rga | `ripgrep_all` | rg over pdf/docs/archives |
| delta | `git-delta` | git diff pager |
| jj | `jj-cli` | Jujutsu VCS |
| wt | `worktrunk` | git worktree manager (`git-wt`) |
| tldr | `tlrc` | tldr pages |
| tokei | `tokei` | code line counter |
| dua | `dua-cli` | disk usage TUI |
| sg | `ast-grep` | structural code search |
| tree-sitter | `tree-sitter-cli` | parser generator |
| bluetui | `bluetui` | bluetooth TUI |
| sqlx | `sqlx-cli` | sqlx migrations |
| ripdrag | `ripdrag` | drag & drop from terminal |
| cargo-tarpaulin | `cargo-tarpaulin` | coverage |
| cargo-install-update | `cargo-update` | `cargo install-update -a` |
| cargo-binstall | `cargo-binstall` | binary installer |
| nu plugins | `nu_plugin_formats nu_plugin_gstat nu_plugin_inc nu_plugin_polars nu_plugin_query` | nushell plugins |
| bob | `bob-nvim` (git MordechaiHadad/bob) | neovim version manager |
| mirador | git `https://github.com/pimalaya/mirador` | mail TUI |
| pdfrip | git `https://github.com/mufeedvh/pdfrip` | PDF password cracker |
| tpop | local `~/personal/clones/tpop` (github 012e/tpop) | personal |
| bruhh | local `~/tmp/bruhh` (no remote) | personal, **not recoverable – back up** |

```sh
cargo install ast-grep bat bluetui cargo-binstall cargo-tarpaulin cargo-update eza fd-find git-delta jj-cli \
  nu_plugin_formats nu_plugin_gstat nu_plugin_inc nu_plugin_polars nu_plugin_query ripdrag ripgrep ripgrep_all \
  sqlx-cli tlrc tokei tree-sitter-cli worktrunk dua-cli
cargo install --git https://github.com/MordechaiHadad/bob.git bob-nvim
cargo install --git https://github.com/pimalaya/mirador.git
cargo install --git https://github.com/mufeedvh/pdfrip.git
cargo install --git https://github.com/012e/tpop.git
```

## 3. uv, Python tools
```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.12 3.15      # 3.12.9 and 3.15.0a5 were installed (symlinked in ~/.local/bin)
```

### `uv tool list`
```sh
uv tool install bt-dualboot      # bluetooth dual-boot key sync
uv tool install cronboard        # cron TUI
uv tool install epy-reader       # epub TUI reader
uv tool install git-filter-repo
uv tool install harlequin        # SQL TUI
uv tool install llm              # Simon Willison's LLM CLI
uv tool install marimo           # notebooks
uv tool install mdformat
uv tool install patool
uv tool install vosk             # vosk-transcriber
```

## 4. Go
Go via snap (`sudo snap install go --classic`).
```sh
go install golang.org/x/tools/gopls@latest
```

## 5. Node (mise) and npm globals
```sh
curl https://mise.run | sh
mise use -g node@24 pnpm
npm i -g @google/gemini-cli
```

## 6. Snap
```sh
sudo snap install ghostty --classic
sudo snap install code --classic
sudo snap install nvim --classic
sudo snap install zellij --classic
sudo snap install zig --classic
sudo snap install go --classic
sudo snap install intellij-idea --classic     # (ultimate/community? check)
sudo snap install rider --classic
sudo snap install just --classic
sudo snap install firefox gimp libreoffice obsidian simplescreenrecorder telegram-desktop typst
```

## 7. Flatpak
```sh
flatpak install flathub com.bilingify.readest com.stremio.Stremio
```

## 8. Manual binaries in `~/.local/bin` (no package manager)
Re-download from upstream:
| Binary | Source |
|---|---|
| agy | Antigravity CLI |
| claude | Claude Code (`curl -fsSL https://claude.ai/install.sh \| bash`) |
| codex | OpenAI Codex CLI (standalone install) |
| mise | https://mise.run |
| duckdb | https://install.duckdb.org |
| lazydocker | https://github.com/jesseduffield/lazydocker |
| d2 | https://d2lang.com (`curl -fsSL https://d2lang.com/install.sh \| sh`) |
| ory | https://www.ory.sh/cli |
| herdr, plannotator, rtk, t3code, but (GitButler CLI) | upstream releases |
| tectonic | https://tectonic-typesetting.github.io |
| fairy-stockfish (+ largeboard) | https://github.com/fairy-stockfish/Fairy-Stockfish |
| pnpm-shell-completion | https://github.com/g-plane/pnpm-shell-completion |
| dockerd / docker-init / docker-proxy (rootless) | docker rootless extras |

## 9. Git repositories (clone to restore)
Own repos (github `012e`):
```sh
git clone https://github.com/012e/bin.git ~/bin
git clone https://github.com/012e/nvim-config.git ~/.config/nvim
git clone https://github.com/tmux-plugins/tmux-yank ~/.config/tmux/tmux-yank
mkdir -p ~/personal/any ~/personal/clones ~/tmp
cd ~/personal/any
for r in uit-ponr doan1 doan2 java-testing-demo scrape-vnexpress thesis theater-mgnt twider-backend; do git clone https://github.com/012e/$r.git; done
git clone https://github.com/012e/bot-dkhp-uit
git clone https://github.com/012e/resume.git basic-resume
git clone https://github.com/012e/spring-session-cache-poc.git course-registration-backend
cd ~/personal
git clone https://github.com/012e/docs
git clone https://github.com/012e/18072025.git
cd ~/personal/clones
for r in bookstore-db-mockgen tpop dwm-huy nvimrc scrape-thpt st-luke; do git clone https://github.com/012e/$r.git; done
for r in clipboard-image.nvim heap-sort-visualizer saygex; do git clone https://github.com/012e/$r; done
cd ~/tmp
git clone https://github.com/012e/PhpCoffee
git clone https://github.com/012e/DsaReport3
```
> [!WARNING]
> These git repos have **no remote** – back them up manually or they are lost:
> `~/personal/any/{untitled,chatbox-svelte,chatbox-svelte-update,tcn-chatbot-old,blog,diemuit,pishop,royal-epub,devio,notebooks}`,
> `~/personal/learn/go-aoc-2024`, `~/tmp/{leetcode,testpy,bruhh}`.

## 10. Other things to back up
- `~/.config` (yadm), `~/.ssh`, `~/.gnupg`, `~/.local/share/{gopass,fish,fonts,applications}`
- Docker volumes, DBeaver (`~/.local/share/DBeaverData`), Insomnia/Bruno collections
- Re-run `yadm` bootstrap, `chsh -s /usr/bin/fish`

## 11. yadm coverage audit
Tracked (128 files): Xresources.d, bat, direnv, dunst, fish, flameshot, foot, ghostty, git, lazygit, opencode, picom, rofi, tmux, wezterm, xfce4, zathura, `user-dirs.dirs`, `~/.ideavimrc`, `~/.xinitrc`, `~/.ssr/settings.conf`. `~/.config/nvim` is a separate repo (012e/nvim-config).

**Not tracked, but contain hand-written config (consider `yadm add`):**
`nushell zellij jj television htop btop mpv zed hypr waybar qtile kitty alacritty himalaya mirador task todoman lazydocker herdr worktrunk pgcli wofi vicinae gh(config.yml only)`, plus `~/.bashrc ~/.zshrc ~/.profile ~/.xprofile ~/.Xresources ~/.gitignore ~/.gitignore.d ~/.claude/{settings.json,CLAUDE.md} ~/.codex/config.toml`.

**Secrets – do NOT put in the public repo; back up separately/encrypted (`yadm encrypt`):**
`~/.ssh ~/.gnupg ~/.netrc ~/.npmrc ~/.vault_pass.txt ~/.ory-cloud.json ~/.aws ~/.docker/config.json ~/.config/gh/hosts.yml ~/.config/gopass ~/.config/rbw ~/.claude.json`.

**Hygiene:** `fish_variables` churns on every change.
