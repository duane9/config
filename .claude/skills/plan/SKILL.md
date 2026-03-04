---
name: plan
description: Reads requirements from a markdown file and appends a detailed implementation plan to it.
---

Read the markdown file at the path provided. Analyze all requirements, user stories, goals, and constraints described in the file.

Then append a new section to the end of the file titled `## Implementation Plan` (do not overwrite existing content). The implementation plan should include:

- A brief summary of the approach
- Numbered implementation steps in logical order
- For each step: what needs to be done and any important technical considerations
- A "Open Questions / Assumptions" section if any requirements are ambiguous
- A test plan, including automated tests if they are used in the codebase.

Write the plan directly into the file using the Edit or Write tool. Do not just print the plan — it must be saved to the file.

The markdown file to read and update: $ARGUMENTS
