# Load .env file if it exists
if [ -f ".env" ]; then
	# Set -a to automatically export all variables
	set -a
	source .env
	set +a
fi

# Git identity setup
if [ ! -f ".config/git/config" ]; then
	echo '📝 Git identity not found. Please set it for this workspace.'
	mkdir -p .config/git
	read -p 'Enter Git User Name: ' git_name
	read -p 'Enter Git User Email: ' git_email
	printf "[user]
  name = %s
  email = %s
" "$git_name" "$git_email" >.config/git/config
	echo '✅ Git identity saved to .config/git/config'
fi

# Volta installation (node and yarn only)
if [ ! -d "$VOLTA_HOME/tools" ]; then
	echo '📦 Installing node and yarn with volta...'
	volta install node@20
	volta install yarn@1.22.22
fi

# Global package installation with bun
BUN_GLOBAL="$BUN_INSTALL/install/global"
packages=(
	typescript
	@vtsls/language-server
	@vue/language-server
	@fsouza/prettierd
	@tailwindcss/language-server
	@google/gemini-cli
	wsl-open
)
for pkg in "${packages[@]}"; do
	if ! grep -q "\"$pkg\"" "$BUN_GLOBAL/package.json" 2>/dev/null; then
		echo "📦 Installing $pkg with bun..."
		bun install -g "$pkg"
	fi
done

# Claude Code native installation
if ! command -v claude &>/dev/null; then
	echo '📦 Installing Claude Code...'
	curl -fsSL https://claude.ai/install.sh | bash
fi
