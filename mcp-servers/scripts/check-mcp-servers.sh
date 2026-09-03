#!/bin/bash

# Define the servers you want to ensure are installed
# Format: "@modelcontextprotocol/server-filesystem"
# Remember To Update mcp.json with any servers Visual Studio Code Needs To Use

MCP_NODE_PATH="$HOME/.local/share/modelcontextprotocol"

SERVERS=(
  "@modelcontextprotocol/server-filesystem"
  "@modelcontextprotocol/server-sequential-thinking"
)

echo "Check For Node.js And npm..."
if ! command -v node >/dev/null 2>&1; then
  echo "❌ Node.js is not installed. Please install Node.js to continue."
  exit 1
fi

echo "Ensuring MCP Node Path Exists..."
[ -d "$MCP_NODE_PATH" ] || mkdir -p "$MCP_NODE_PATH"
OLDPATH=$(pwd)
cd "$MCP_NODE_PATH" || exit

echo "Checking MCP Server dependencies..."
echo

for package in "${SERVERS[@]}"; do
  # Check if the package is installed in the local node_modules
  if npm list "$package" --depth=0 >/dev/null 2>&1; then
    echo "✅ $package is already installed."
    echo
  else
    echo "🚀 $package not found. Installing..."
    npm install "$package"
    echo
  fi
done

echo "Done! MCP Servers Are Installed."
cd "$OLDPATH" || exit
