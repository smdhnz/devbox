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

# Volta package installation
if [ ! -d "$VOLTA_HOME/tools" ]; then
	echo '📦 Installing node, yarn and global packages with volta...'
	volta install node@20
	volta install yarn@1.22.22
	volta install \
		@google/gemini-cli \
		typescript \
		@vtsls/language-server \
		@vue/language-server \
		@fsouza/prettierd \
		@tailwindcss/language-server \
		wsl-open
fi

# Claude Code native installation
if ! command -v claude &>/dev/null; then
	echo '📦 Installing Claude Code...'
	curl -fsSL https://claude.ai/install.sh | bash
fi
