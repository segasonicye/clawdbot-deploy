#!/bin/bash
set -e

echo "🚀 Starting Clawdbot..."

# 确保npm在PATH中
export PATH="$HOME/.npm-global/bin:$PATH"

# 检查openclaw是否已安装
if ! command -v openclaw &> /dev/null; then
    echo "📦 Installing OpenClaw..."
    curl -fsSL https://molt.bot/install.sh | bash
else
    echo "✓ OpenClaw already installed"
fi

# 配置Clawdbot
echo "⚙️  Configuring Clawdbot..."
openclaw config set run.background true

# 启动Clawdbot
echo "▶️  Starting Clawdbot..."
nohup openclaw agent:main > /tmp/clawdbot.log 2>&1 &

echo "✓ Clawdbot started!"
echo "📝 Logs: tail -f /tmp/clawdbot.log"
echo "🌐 Gateway URL: http://localhost:18791"
