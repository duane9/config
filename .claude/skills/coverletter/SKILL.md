---
name: coverletter
description: Reads a job description file and a resume file, then generates a tailored cover letter saved as a txt file.
---

You are generating a professional cover letter. Two file paths are provided as arguments: the first is the job description file, the second is the resume file.

Arguments: $ARGUMENTS

Parse the arguments to extract:
1. The job description file path (first argument)
2. The resume file path (second argument)

Steps:
1. Read the job description file and extract: company name, role title, key responsibilities, required skills, and any stated values or culture signals.
2. Read the resume file and extract: the candidate's name, contact info, relevant experience, skills, and notable achievements.
3. Write a cover letter that:
   - Opens with a strong, specific hook referencing the role and company — no generic openers
   - Matches 2-3 of the candidate's strongest experiences or achievements directly to the job's key requirements
   - Reflects the company's stated values or tone where evident
   - Closes with a confident call to action
   - Is 3-4 paragraphs, professional but not stiff
   - Does NOT include a subject line or email header — just the letter body starting with the salutation
4. Save the cover letter to a new file named `cover-letter-<role-slug>.txt` in the same directory as the job description file, where `<role-slug>` is a lowercase, hyphenated version of the role title (e.g., `cover-letter-senior-backend-engineer.txt`).

Use the Read tool to read both files, then the Write tool to save the output. Confirm the output file path to the user when done.
