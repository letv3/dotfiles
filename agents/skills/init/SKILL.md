---
name: init
description: Use ONLY when starting work in a new repository or project to set up the experimentation and knowledge capture infrastructure. Creates local/ and memory/ directories with proper configuration. Trigger phrases - "init this project", "setup local and memory", "initialize experimentation workspace", "prepare project for local work".
---

# Init Skill

Initialize a new project/repository with the infrastructure for experimentation and knowledge capture.

## Purpose

This skill sets up the `local/` and `memory/` directory structure and configuration needed for:
- Session-based experimentation and exploration
- Persistent knowledge capture across sessions
- Integration with the `local-to-memory` skill

## When to Use

**Use ONLY once per project**, when first encountering a new repository:
- Starting work in a new clone
- Beginning collaboration on a new project
- Setting up experimentation infrastructure

**Do NOT use** if the project already has `local/` and `memory/` directories configured.

## What It Creates

### 1. Directory Structure
```
project-root/
├── local/          # Session-based experimentation (gitignored)
│   └── .gitkeep
└── memory/         # Persistent knowledge storage (gitignored)
    └── AGENTS_LOCAL.md
```

### 2. Git Configuration
Updates `.gitignore` to exclude contents while preserving structure:
```gitignore
# Local dev / personal
local/
/memory/
```

### 3. Documentation
Creates `memory/AGENTS_LOCAL.md` with workspace conventions:
- Naming conventions for `local/` directories
- What belongs in `local/` vs production code
- What belongs in `memory/` vs `local/`
- Workflow: explore → extract → preserve → cleanup

### 4. Opencode Configuration
Updates `.opencode/opencode.json` (or creates if missing) with watcher configuration that ensures `local/` and `memory/` are indexed.

## Workflow

### Step 1: Check Current State
Before making changes, verify:
- Do `local/` and `memory/` already exist?
- Is there an existing `.gitignore`?
- Is there an existing `.opencode/opencode.json`?

### Step 2: Create Directories
```bash
mkdir -p local memory
touch local/.gitkeep memory/.gitkeep
```

### Step 3: Update .gitignore
Add or ensure these entries exist:
```gitignore
# Local dev / personal
local/
/memory/
```

### Step 4: Create memory/AGENTS_LOCAL.md
Write the workspace conventions documentation (see template below).

### Step 5: Configure opencode (if applicable)
If `.opencode/opencode.json` exists and has a `watcher.ignore` section, verify that `local/` and `memory/` are NOT in the ignore list.

## AGENTS_LOCAL.md Template

```markdown
# Local Development Workspace

Each new session should create a dedicated folder under `local/` for experimentation and exploration.

**Naming convention:** Use short but clear names that describe the session's purpose:
- `local/campaign-refactor/` - not `local/session-2026-08-20/`
- `local/api-client-poc/` - not `local/test-123/`

**What goes in local/:**
- Experimentation scripts and notebooks
- Scratch work and exploration code
- Draft documentation and notes
- Temporary test data

**What does NOT go in local/:**
- Code intended for production
- Committed documentation (use project docs/)
- Shared configuration files

**Workflow:**
1. At session start, create `local/<descriptive-name>/`
2. Do your exploration and experimentation there
3. When finished, evaluate: does anything here need to be preserved?
4. Use the `local-to-memory` skill to extract important learnings into `memory/`
5. Clean up `local/` when the work is complete (optional)

# Persistent Memory

Important insights, patterns, and learnings from experiments should be captured in `memory/` for future sessions.

**Naming convention:**
- `memory/<topic>-<date>.md` - e.g., `memory/campaign-api-patterns-2026-08.md`
- `memory/lessons-<category>.md` - e.g., `memory/lessons-evals.md`

**What goes in memory/:**
- Reusable patterns discovered during experimentation
- Lessons learned from failed approaches
- Architectural decisions and rationale
- Useful code snippets and examples
- Troubleshooting guides

**What does NOT go in memory/:**
- Raw experimentation output (keep in `local/`)
- Session-specific notes
- Temporary or incomplete thoughts

Use the `local-to-memory` skill to systematically extract and preserve important information.
```

## Output

After running this skill, the project is ready for:
- Creating session-specific experimentation folders in `local/`
- Capturing persistent knowledge in `memory/`
- Using the `local-to-memory` skill to extract learnings

## Verification Checklist

- [ ] `local/` directory exists with `.gitkeep`
- [ ] `memory/` directory exists with `.gitkeep` and `AGENTS_LOCAL.md`
- [ ] `.gitignore` excludes `local/` and `/memory/`
- [ ] `.opencode/opencode.json` does NOT exclude `local/` or `memory/` from watcher
- [ ] Documentation explains the workflow to future agents

## Notes

- This is a one-time setup per project
- The skill is idempotent - running it again on an initialized project should verify configuration rather than duplicate it
- If the project already has similar infrastructure, adapt to match existing conventions
