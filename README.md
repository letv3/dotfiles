# Dotfiles

Essential configuration files for agentic development with opencode and Claude Code.

## Files Included

### Shell & Environment
- `.zshrc` - Main shell configuration with:
  - Powerlevel10k theme
  - SSH agent setup
  - Google Cloud SDK integration
  - uv (Python package manager) setup
  - Go PATH configuration
  - Claude-Code environment variables (sanitized)
  - Aliases loading

- `.aliases/personal` - General shell aliases for:
  - File listing (ll, la, l)
  - Python/pyenv shortcuts
  - Shell reloading

### Git
- `.gitconfig` - Git configuration with:
  - User info (placeholder - update with your details)
  - GitLab URL rewriting rules

### Terminal
- `.tmux.conf` - Tmux configuration with mouse support enabled

### Claude Code
- `claude-code/settings.json` - Claude Code settings:
  - Default model (haiku)
  - Status line configuration
  - Enabled plugins (bloomreach-essentials)
  - Theme and effort level settings

- `claude-code/statusline-command.sh` - Custom status line script:
  - Shows current directory, git branch, context usage
  - Mirrors Powerlevel10k prompt style

- `claude-code/plugins/bloomreach-essentials.mcp.json` - MCP server configurations:
  - Atlassian (Jira/Confluence) SSE
  - Chrome DevTools
  - Context7 documentation

- `claude-code/plugins/installed_plugins.json` - Plugin registry
- `claude-code/plugins/bloomreach-essentials-help.md` - Plugin help command

### Opencode / Agentic Development
- `opencode/opencode.jsonc` - Main opencode configuration:
  - Model routing and provider setup
  - MCP servers (Phoenix, DuckDuckGo, Glean)
  - Bloomreach LiteLLM integration
  - API keys use environment variables (sanitized)

- `opencode/oh-my-openagent.json` - Agent orchestration configuration:
  - Agent model assignments (sisyphus, oracle, librarian, etc.)
  - Category-based model routing
  - Fallback model chains

- `opencode/agents/code-reviewer.md` - Code reviewer agent definition

## Setup Instructions

1. **Clone and copy files:**
   ```bash
   git clone git@github.com:letv3/dotfiles.git
   cd dotfiles
   ```

2. **Back up existing configs:**
   ```bash
   mv ~/.zshrc ~/.zshrc.backup
   mv ~/.gitconfig ~/.gitconfig.backup
   ```

3. **Copy new configs:**
   ```bash
   cp .zshrc ~/
   cp .gitconfig ~/
   cp .tmux.conf ~/
   cp -r .aliases ~/
   cp -r opencode ~/.config/
   cp -r claude-code ~/.claude/
   ```

4. **Update placeholders:**
   - Edit `~/.zshrc` and replace `<YOUR_ANTHROPIC_AUTH_TOKEN_HERE>` and `<YOUR_LITELLM_API_KEY_HERE>` with your actual API keys
   - Edit `~/.gitconfig` with your name and email

5. **Reload shell:**
   ```bash
   source ~/.zshrc
   ```

## Security Notes

- **Never commit API keys** to this repository
- This repository contains placeholder values for sensitive data
- Store actual API keys in your shell environment or a secure keychain
- The `.zshrc` expects:
  - `ANTHROPIC_AUTH_TOKEN` - For Claude Code authentication
  - `LITELLM_API_KEY` - For Bloomreach LiteLLM proxy access

## Agent Model Configuration

The `oh-my-openagent.json` configures the following agents:

| Agent | Primary Model | Purpose |
|-------|--------------|---------|
| sisyphus | bedrock/kimi-k2.5 | Primary orchestrator |
| oracle | openai/gpt-5.6-sol (xhigh) | Complex debugging/architecture |
| librarian | vertex_ai/glm-5 | External documentation search |
| explore | vertex_ai/glm-5 | Codebase exploration |
| prometheus | bedrock/claude-sonnet-5 | Planning and work breakdown |
| metis | bedrock/claude-sonnet-4-6 | Pre-planning consultant |
| momus | openai/gpt-5.6-terra | Plan review and QA |

Categories route tasks to appropriate models based on domain (visual-engineering, ultrabrain, deep, etc.)
