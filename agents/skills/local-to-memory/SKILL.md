---
name: local-to-memory
description: Use when you need to extract and preserve important learnings, patterns, or insights from experimentation work in the local/ directory into persistent memory/ storage. Trigger phrases - "extract learnings from local", "capture insights from experiments", "save findings to memory", "document what we learned", "preserve patterns from local".
---

# Local to Memory Skill

Extract important learnings from experimentation work in `local/` and preserve them in `memory/` for future sessions.

## Purpose

This skill helps systematically capture valuable insights discovered during exploration and experimentation, ensuring knowledge is not lost when `local/` directories are cleaned up.

## When to Use

- After completing an experiment or exploration session
- When you discover reusable patterns or approaches
- When you learn what doesn't work (failed approaches)
- When you identify useful code snippets or examples
- When you develop troubleshooting guides or workarounds
- When the user explicitly asks to "save" or "capture" learnings

## Prerequisites

Before using this skill, ensure the project has been initialized with:
- `local/` directory for experimentation
- `memory/` directory for persistent storage

If these don't exist, run the `init` skill first.

## Workflow

### 1. Identify the Source

Determine which `local/` directory contains the work to extract from:
- `local/<session-name>/` - the folder created for a specific exploration
- May contain scripts, notebooks, notes, drafts, test data

### 2. Review the Content

Read the files in the local directory to identify:
- **Patterns**: Reusable approaches or solutions
- **Lessons**: What worked and what didn't
- **Decisions**: Architectural or design decisions made
- **Code snippets**: Useful examples worth preserving
- **Troubleshooting**: Problems encountered and how they were solved

### 3. Determine Output Location

Create files in `memory/` with appropriate naming:
- `memory/<topic>-<date>.md` - Topic-specific learnings (e.g., `campaign-api-patterns-2026-08.md`)
- `memory/lessons-<category>.md` - Category-based lessons (e.g., `lessons-evals.md`)

### 4. Extract and Structure

For each memory file, structure the content:

```markdown
# <Title>

**Source**: local/<session-name>/
**Date**: <YYYY-MM-DD>
**Context**: <Brief context of the exploration>

## Key Findings

### <Finding 1>
<Description and details>

### <Finding 2>
<Description and details>

## Patterns Discovered

### <Pattern Name>
<Description, when to use, example code if applicable>

## Lessons Learned

### What Worked
- <Lesson 1>
- <Lesson 2>

### What Didn't Work
- <Failed approach 1> - <Why it failed>
- <Failed approach 2> - <Why it failed>

## Code Snippets

### <Snippet Name>
```<language>
<code>
```

## Decisions Made

- **<Decision>**: <Rationale and context>

## Open Questions / Follow-ups

- <Question or area for future exploration>
```

### 5. Cross-Reference

Check if related memory files already exist:
- Update existing files if the new learnings extend them
- Create new files if the topic is distinct
- Link between related memory files when appropriate

### 6. Summarize

Provide a brief summary to the user:
- What was extracted
- Where it was saved
- Any follow-up actions recommended

## Examples

### Example 1: API Exploration

User: "Capture what we learned about the Engagement API from local/api-exploration/"

Actions:
1. Read files in `local/api-exploration/`
2. Identify patterns, working approaches, and pitfalls
3. Create `memory/engagement-api-patterns-2026-08.md`
4. Include: authentication patterns, common endpoints, error handling, rate limits

### Example 2: Failed Approach Documentation

User: "Save the lessons from the caching experiment in local/cache-poc/"

Actions:
1. Read files in `local/cache-poc/`
2. Document what was tried and why it failed
3. Create `memory/lessons-caching.md` or update existing
4. Include: approach taken, specific failure modes, alternative approaches to try

### Example 3: Code Snippet Preservation

User: "Extract the useful utilities from local/data-processing/"

Actions:
1. Read files in `local/data-processing/`
2. Identify reusable utilities and functions
3. Create `memory/snippets-data-processing.md`
4. Include: function signatures, usage examples, edge cases handled

## Output Rules

1. **Always link back**: Include the source `local/` directory in the memory file
2. **Be specific**: Concrete examples > general descriptions
3. **Include context**: Why something works or fails matters
4. **Date everything**: Helps assess relevance over time
5. **Keep it searchable**: Use clear headings and consistent formatting
6. **No raw dumps**: Don't just copy-paste; curate and structure the learnings

## Anti-Patterns

- **Don't** preserve everything - only valuable, reusable insights
- **Don't** create memory files for temporary or incomplete thoughts
- **Don't** duplicate content between memory files - link instead
- **Don't** preserve sensitive data, credentials, or personal information
