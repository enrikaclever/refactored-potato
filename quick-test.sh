#!/bin/bash

# Quick Test Script for Hermes Agent
# This script tests if Hermes is properly installed and configured

echo "=========================================="
echo "Hermes Agent - System Check"
echo "=========================================="
echo ""

# Check if Hermes is installed
if command -v hermes &> /dev/null; then
    echo "✅ Hermes Agent is installed"
    HERMES_VERSION=$(hermes --version 2>/dev/null || echo "unknown")
    echo "   Version: $HERMES_VERSION"
else
    echo "❌ Hermes Agent is NOT installed"
    echo ""
    echo "Run the setup script first:"
    echo "  bash hermes-setup.sh"
    exit 1
fi

echo ""
echo "=========================================="
echo "Configuration Status"
echo "=========================================="
echo ""

# Check config directory
if [ -d "$HOME/.hermes" ]; then
    echo "✅ Hermes config directory found: ~/.hermes"
else
    echo "⚠️  Hermes config directory not found (will be created on first run)"
fi

echo ""
echo "=========================================="
echo "Running Diagnostics"
echo "=========================================="
echo ""

# Run hermes doctor if available
if hermes doctor &> /dev/null; then
    echo "✅ Running hermes doctor..."
    hermes doctor 2>&1 | head -20
else
    echo "⚠️  Could not run hermes doctor"
fi

echo ""
echo "=========================================="
echo "Quick Start Options"
echo "=========================================="
echo ""
echo "To get started, choose one:"
echo ""
echo "1. Full interactive setup:"
echo "   hermes setup"
echo ""
echo "2. Start chatting immediately:"
echo "   hermes"
echo ""
echo "3. Configure just the model:"
echo "   hermes model"
echo ""
echo "4. Check system health:"
echo "   hermes doctor"
echo ""
