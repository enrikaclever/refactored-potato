#!/bin/bash

# Hermes Agent Quick Setup Script
# This script installs and configures Hermes Agent for first-time use

set -e

echo "=========================================="
echo "Hermes Agent - Quick Setup"
echo "=========================================="
echo ""

# Check for required commands
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $1 is not installed. Please install it first."
        return 1
    fi
    echo "✅ $1 found"
}

echo "Checking prerequisites..."
check_command "curl" || exit 1
check_command "bash" || exit 1
echo ""

# Install Hermes Agent
echo "Installing Hermes Agent..."
echo "(This may take a few minutes on first install)"
echo ""

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (PowerShell)
    echo "Detected Windows. Using PowerShell installer..."
    powershell -Command "irm https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.ps1 | iex"
else
    # Linux, macOS, WSL2, Termux
    echo "Detected Unix-like system. Using bash installer..."
    curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
fi

echo ""
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Reload your shell:"
echo "   source ~/.bashrc    # or source ~/.zshrc"
echo ""
echo "2. Start Hermes Agent:"
echo "   hermes"
echo ""
echo "3. On first run, you'll be prompted to:"
echo "   - Choose an LLM provider (OpenAI, Anthropic, OpenRouter, etc.)"
echo "   - Set up your API keys"
echo "   - Configure which tools to enable"
echo ""
echo "4. Or run the full setup wizard:"
echo "   hermes setup"
echo ""
echo "For more info, visit:"
echo "📚 https://hermes-agent.nousresearch.com/docs/"
echo "💬 https://discord.gg/NousResearch"
echo ""
