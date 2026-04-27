# Agent Instructions for Flutter Form Designer

This repository uses a lightweight Get Shit Done execution framework. The purpose is to keep product discovery, architecture, implementation, verification, and commits moving in small, durable steps.

## Product Context

`Flutter Form Designer` is a developer-first RAD Visual View Composer for Flutter.

The product owns the View layer and generates Flutter/Dart view code from designer-owned schema files. Business logic remains developer-owned through ViewModel, Controller, or Presenter contracts.

Primary product references:

- Delphi / RAD Studio for component-oriented RAD workflow.
- JFormDesigner for professional developer-first UI design.
- Flutter/Dart for modern cross-platform runtime and generated view code.

## Core Product Doctrine

1. View-only by default.
2. Developer-owned business logic.
3. Schema as the source of truth for designed views.
4. Generated code must be boring, readable, deterministic, and Flutter-native.
5. Design-time data preview is a first-class requirement.
6. Undo/redo is an architectural requirement, not a later UI feature.
7. Do not pursue arbitrary Dart AST round-trip editing in MVP.
8. Do not turn the product into a no-code platform.

## GSD Workflow

For every task:

1. Capture the requested outcome.
2. Slice it into the smallest useful durable artifact.
3. Execute one concrete change.
4. Verify the result.
5. Commit the artifact.
6. Report the commit, file links, and next action.

Avoid vague progress. Prefer committed artifacts.

## Done Criteria

A task is not done until:

- the requested file or code change exists;
- the result has been verified from the repository after commit;
- any diagrams or generated examples have been checked for formatting errors;
- the response reports the commit hash and direct file link when relevant.

## ASCII Diagram Rule

When adding or editing ASCII diagrams:

1. Use fenced code blocks with `text`.
2. Prefer plain ASCII characters: `+`, `-`, `|`, `>`, `v`, and spaces.
3. Verify that every vertical `|` column aligns correctly across related box lines.
4. Do not replace a requested ASCII diagram with a hierarchical list unless explicitly asked.
5. Avoid Unicode box-drawing characters unless the user explicitly requests them.

## Documentation Rules

- Keep PRD-level content in `docs/PRD.md`.
- Put architecture details in `docs/architecture.md`.
- Put schema details in `docs/schema-format.md`.
- Put design-time data preview details in `docs/design-time-data-preview.md`.
- Put generated-code strategy in `docs/code-generation.md`.
- Put execution process in `docs/gsd-framework.md`.

## Implementation Rules

- Use small commits with clear messages.
- Keep generated code separate from developer-owned code.
- Prefer schema-first design for MVP.
- Add tests or verification notes when implementation begins.
- Do not introduce state-management lock-in unless a document explicitly decides it.

## Current Milestone Bias

The current bias is toward M0 and M1:

- M0: design schema and static designer prototype.
- M1: design-time data preview using JSON fixtures.

Prioritize docs, schema, command model, code generation spikes, and preview fixtures before advanced REST proxy or arbitrary Dart parsing.
