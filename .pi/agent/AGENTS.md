# ルール

- ユーザーへの返答は日本語で行うこと
- `cat`や`>>`による挿入はなるべく使わず、ReadFileツールやWriteFileツール, Editツールを使うこと
- 行動する前にユーザーに対して軽く説明をすること
- `grep`などの検索ツールを使う際は`.nuxt`や`node_modules`や`.venv`を除外して検索すること
- `jq`インストール済みなので、jsonの操作については`jq`を活用すること
- コミットメッセージは必ず日本語で行ってください。
- 明示的な指示がない場合はコードを変更せず、調査と分析にとどめ、結果を報告すること

# Pi 内 bash で使える devbox 関数

`settings.json` の `shellCommandPrefix` により、Pi の bash ツール実行時は `~/devbox/bash_functions.sh` が読み込まれる。
そのため、必要に応じて以下の関数を利用できる。

- `activate`: カレントディレクトリまたは親ディレクトリの `.venv` を有効化。なければ `uv venv` で作成する
- `tree`: `node_modules`, `dist`, `build`, `.venv`, `__pycache__`, `.git` などを除外した簡易ツリー表示
- `xcat`: 複数ファイルを Markdown コードブロック形式で連結表示
- `fixperm`: ファイル/ディレクトリの権限を標準的な値に修正
- `del`: ファイルを日付別の trash ディレクトリへ移動
- `discord`: Discord Webhook にメッセージまたはファイルを送信
- `clip`: OSC 52 でクリップボードへコピー
- `extract`: 各種 archive を展開
- `ports`: listen 中のポートを表示
- `serve`: カレントディレクトリを HTTP 配信
- `gundo`: 直前の git commit を soft reset
