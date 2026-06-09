# Load .env file if it exists
if [ -f ".env" ]; then
	# Set -a to automatically export all variables
	set -a
	source .env
	set +a
fi

# Volta installation (node and yarn only)
if [ ! -d "$VOLTA_HOME/tools" ]; then
	echo '📦 Installing node and yarn with volta...'
	volta install node@22
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
	@earendil-works/pi-coding-agent
	context-mode
	wsl-open
)
for pkg in "${packages[@]}"; do
	if ! grep -q "\"$pkg\"" "$BUN_GLOBAL/package.json" 2>/dev/null; then
		echo "📦 Installing $pkg with bun..."
		bun install -g "$pkg"
	fi
done
