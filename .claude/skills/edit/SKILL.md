---
name: edit
description: Finds documentation files in the current repo and scans them for typos and grammar errors, reporting issues with proposed fixes.
---

Scan the current repository for documentation files and check them for typos and grammar errors.

## Steps

1. **Find all documentation files** — Use the Agent tool with subagent_type `Explore` to find every documentation file in the repository. Ask it to search for all files matching these patterns and return the complete list of paths (do not truncate or sample):
   - `**/*.md`
   - `**/*.rst`
   - `**/*.txt` (only if they appear to be docs, e.g. README.txt, CHANGELOG.txt, files under `docs/`)
   - `docs/**/*`
   - `**/*.mdx`

   Exclude common non-doc paths: `node_modules/`, `.git/`, `dist/`, `build/`, `__pycache__/`, `*.min.*`, `vendor/`.

2. **Read all files exhaustively** — Use the Agent tool with subagent_type `Explore` to read every documentation file found. Pass it the full list of file paths and instruct it to read each one completely and return all prose text content. Do not sample or skip files — every file must be read.

3. **Scan for errors** — For each file, carefully review the text for:
   - **Typos**: misspelled words, doubled words (e.g. "the the"), wrong word forms
   - **Grammar errors**: subject-verb disagreement, incorrect tense, missing articles, dangling modifiers, run-on sentences, sentence fragments
   - **Punctuation errors**: missing or extra commas, incorrect apostrophes, mismatched quotes
   - **Capitalization errors**: incorrect capitalization of common nouns or inconsistent heading styles

   Focus on prose text. Skip code blocks (fenced with ``` or indented), inline code (backtick-wrapped), URLs, and file paths — these should not be corrected.

4. **Report findings** — Present a structured report grouped by file. For each issue found:
   - Show the **file path**
   - Show the **line number** (if determinable)
   - Show the **original text** (quote the problematic phrase or sentence)
   - Show the **issue type** (Typo / Grammar / Punctuation / Capitalization)
   - Show the **proposed fix** (the corrected text)

   Use this format for each issue:

   ```
   ### <file path>

   | # | Line | Type | Original | Proposed Fix |
   |---|------|------|----------|--------------|
   | 1 | 12   | Typo | "recieve the mesage" | "receive the message" |
   ```

5. **Summary** — After the per-file report, print a brief summary:
   - Total files scanned
   - Total issues found
   - Breakdown by type (Typos, Grammar, Punctuation, Capitalization)

If no issues are found in a file, skip it from the report. If no issues are found anywhere, say so clearly.

If $ARGUMENTS is provided, treat it as a specific file path or directory to scope the scan to instead of the entire repo.
