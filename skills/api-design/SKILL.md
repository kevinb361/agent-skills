---
name: api-design
description: Design or review HTTP APIs for resource shape, versioning, authentication, authorization, errors, pagination, idempotency, caching, and evolvability. Use when adding or changing an HTTP surface.
---

# HTTP API design

Start with consumers, operations, trust boundaries, and compatibility constraints. Define resources and behavior before endpoint syntax.

Cover the relevant contract:

- methods, paths, status codes, and content types
- request and response schemas
- validation and stable error shape
- authentication and per-resource authorization
- pagination, filtering, sorting, and bounded limits
- idempotency and retry behavior
- concurrency controls and conditional requests
- caching and rate limits
- observability without secret leakage
- versioning, deprecation, and migration

Prefer boring HTTP semantics and explicit limits. Avoid action-heavy endpoint collections when a resource model is clearer. Distinguish absent, empty, unauthorized, forbidden, conflicted, and temporarily unavailable states.

For a review, cite concrete contract defects and compatibility risks. For a new design, include representative requests, responses, errors, and the decisions consumers must rely on.
