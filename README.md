github

```bash
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

[GitHub Settings > SSH and GPG keys](https://github.com/settings/keys) から登録

---

docker

```bash
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER # 再起動(wsl --shutdown)が必要
```

---

devbox

```bash
echo "" >> ~/.bashrc
echo "cd ~" >> ~/.bashrc
echo "" >> ~/.profile
echo "cd devbox && devbox shell" >> ~/.profile
curl -fsSL https://get.jetpack.io/devbox | bash
git clone git@github.com:smdhnz/devbox.git && cd devbox
devbox shell
```

---

dotfiles (symlinks)

```bash
mkdir -p ~/.claude ~/.gemini ~/.config/nvim

ln -s ~/devbox/.claude/settings.json ~/.claude/settings.json
ln -s ~/devbox/.claude/CLAUDE.md     ~/.claude/CLAUDE.md
ln -s ~/devbox/.gemini/settings.json ~/.gemini/settings.json
ln -s ~/devbox/.gemini/AGENTS.md     ~/.gemini/AGENTS.md
ln -s ~/devbox/.config/nvim/init.lua ~/.config/nvim/init.lua
```
