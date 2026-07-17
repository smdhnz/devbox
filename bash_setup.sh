# Load .env file if it exists
if [ -f ".env" ]; then
	# Set -a to automatically export all variables
	set -a
	source .env
	set +a
fi

# mise installation (node and yarn only)
if ! mise which node >/dev/null 2>&1; then
	echo '📦 Installing node and yarn with mise...'
	mise use -g node@22
	mise use -g yarn@1.22.22
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
	wsl-open
)
for pkg in "${packages[@]}"; do
	if ! grep -q "\"$pkg\"" "$BUN_GLOBAL/package.json" 2>/dev/null; then
		echo "📦 Installing $pkg with bun..."
		bun install -g "$pkg"
	fi
done

# Open OAuth/login URLs in the Windows browser from WSL.
if command -v wsl-open >/dev/null 2>&1; then
	export BROWSER=wsl-open
	export GH_BROWSER=wsl-open
	mkdir -p "$HOME/.local/bin"
	ln -sf "$(command -v wsl-open)" "$HOME/.local/bin/xdg-open"
fi
