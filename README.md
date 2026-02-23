# Devbox Environment

開発環境を即座に構築するための設定群です。

## 1. 準備 (ホストOS)

DockerとDevboxをインストールします。

```bash
# Docker
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER # 再起動(wsl --shutdown)が必要

# Devbox
curl -fsSL https://get.jetpack.io/devbox | bash
```

## 2. セットアップ

```bash
git clone https://github.com/smdhnz/devbox.git
cd devbox
devbox shell
```

### Gitの初期設定
`devbox shell` を初めて起動すると、Gitのユーザー名とメールアドレスの入力を求められます。これらはワークスペース専用の設定 (`.config/git/config`) として保存されます。

### SSHキーの作成とGitHub登録 (ホスト側)
GitHubへのアクセスには、**ホストOS側**のSSHキーを使用します。まだ作成していない場合は、以下の手順でパスフレーズなしのキー（ed25519）を作成し、公開鍵をGitHubに登録してください。

```bash
# ホスト側で実行: キー作成
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519

# 公開鍵を表示
cat ~/.ssh/id_ed25519.pub
```
[GitHub Settings > SSH and GPG keys](https://github.com/settings/keys) から登録してください。
