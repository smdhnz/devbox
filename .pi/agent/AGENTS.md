# ルール

- ユーザーへの返答は日本語で行うこと
- `cat`や`>>`による挿入はなるべく使わず、ReadFileツールやWriteFileツール, Editツールを使うこと
- 行動する前にユーザーに対して軽く説明をすること
- `grep`などの検索ツールを使う際は`.nuxt`や`node_modules`や`.venv`を除外して検索すること
- `jq`インストール済みなので、jsonの操作については`jq`を活用すること
- コミットメッセージは必ず日本語で行ってください。
- 明示的な指示がない場合はコードを変更せず、調査と分析にとどめ、結果を報告すること

# context-mode is active

Use `ctx_*` tools. The extension injects routing rules — follow them.
Note for Pi users: if this project also has CLAUDE.md, Pi.dev reads both files and duplicates routing instructions in context — remove one.
