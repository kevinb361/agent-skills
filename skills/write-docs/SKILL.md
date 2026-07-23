---
name: write-docs
description: Draft or revise technical documentation, specifications, proposals, ADRs, and README content for readers who do not share the current session context. Use when durable written guidance is the deliverable.
---

# Write technical documentation

## Build the reader model

Identify the intended reader, what they are trying to accomplish, what they already know, and what decisions or actions the document must support. Gather facts from code, existing documents, and live behavior where relevant; do not turn assumptions into documentation.

## Draft

Lead with purpose and scope. Organize around the reader's path rather than the author's discovery process. Include prerequisites, concrete examples, failure modes, verification, and rollback where they matter. Separate current behavior from proposals and future work.

Use exact names and commands, but avoid secrets, machine-specific details in public documentation, and stale duplicated source-of-truth content.

## Reader check

Before finishing, reread as someone without this conversation:

- Are terms defined before use?
- Can the reader find the common path quickly?
- Are dangerous or irreversible actions explicit?
- Are examples internally consistent?
- Does every claim have a source or clear status?
- Is ownership of future updates clear?

Verify referenced paths, commands, and links when practical.
