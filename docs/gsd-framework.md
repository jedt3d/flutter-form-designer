# Get Shit Done Framework for Flutter Form Designer

Status: Draft v0.1  
Product: `Flutter Form Designer`  
Purpose: Turn product ideas into verified, committed artifacts quickly.

---

## 1. Why This Framework Exists

`Flutter Form Designer` is a large product idea. It can easily become too abstract: RAD tooling, visual canvas, schema, data preview, code generation, custom components, undo/redo, and Flutter integration.

The Get Shit Done framework keeps work concrete.

A useful unit of progress is not a discussion. A useful unit of progress is:

- a committed document;
- a committed schema;
- a committed prototype;
- a committed test;
- a committed example;
- a committed decision record;
- a verified implementation step.

---

## 2. Core Rule

Every task should produce one durable artifact.

Examples:

- `docs/schema-format.md`
- `docs/design-time-data-preview.md`
- `examples/patient_list/patients.normal.json`
- `packages/designer_schema/lib/src/screen_schema.dart`
- `packages/designer_commands/test/undo_redo_test.dart`
- `docs/decisions/0001-schema-first-view-source.md`

---

## 3. GSD Loop

The workflow diagram below uses fixed-width ASCII characters only. The vertical `|` characters have been checked for alignment.

```text
+------------------+     +------------------+     +------------------+
| Capture          | --> | Slice            | --> | Execute          |
| idea/request     |     | smallest outcome |     | one artifact     |
+------------------+     +------------------+     +------------------+
                                                        |
                                                        v
+------------------+     +------------------+     +------------------+
| Report           | <-- | Commit           | <-- | Verify           |
| link/next action |     | durable change   |     | done criteria    |
+------------------+     +------------------+     +------------------+
```

### Step 1: Capture

Write down the user request or product idea in concrete terms.

Bad:

> Improve the architecture.

Good:

> Create `docs/architecture.md` describing the schema-first architecture, preview runtime, code generator, and ViewModel contract boundary.

### Step 2: Slice

Reduce the task until it can be completed as one artifact.

Bad:

> Build the designer.

Good:

> Define the first `.ffd.yaml` schema example for a login screen.

### Step 3: Execute

Create or update the artifact.

### Step 4: Verify

Verification depends on the artifact type:

- Documentation: fetch from repo and check content.
- ASCII diagram: verify `|` alignment inside code block.
- Schema: parse or manually validate structure.
- Code: run formatter/tests where available.
- Generated code: ensure it compiles in the example app once implementation exists.

### Step 5: Commit

Commit with a clear message.

Examples:

```text
Add initial schema format documentation
Add design-time data preview spec
Implement command model draft
Add patient list fixture example
```

### Step 6: Report

Report:

- what changed;
- direct file link;
- commit hash;
- verification result;
- recommended next task.

---

## 4. Task Types

### 4.1 Product task

Used for PRD, positioning, scope, milestones, user stories, and acceptance criteria.

Template:

```md
# Product Task

## Outcome

## Context

## In Scope

## Out of Scope

## Done Criteria

## Verification
```

### 4.2 Architecture task

Used for module boundaries, runtime architecture, schema ownership, preview design, code generation, and ViewModel contracts.

Template:

```md
# Architecture Task

## Decision / Design Area

## Current Assumption

## Options Considered

## Recommended Direction

## Trade-offs

## Done Criteria

## Verification
```

### 4.3 Implementation task

Used for code changes.

Template:

```md
# Implementation Task

## Goal

## Files To Add / Change

## Acceptance Criteria

## Tests / Verification

## Risks

## Follow-up
```

### 4.4 Spike task

Used for experiments where the answer is unknown.

Template:

```md
# Spike Task

## Question

## Timebox / Scopebox

## Experiment

## Evidence Collected

## Recommendation

## Next Action
```

### 4.5 Decision task

Used when an architectural or product choice must be recorded.

Template:

```md
# Decision Task

## Decision

## Status

## Context

## Options

## Consequences

## Revisit Trigger
```

---

## 5. Priority Model

Use this order unless explicitly overridden:

1. Clarify product boundaries.
2. Define schema and contracts.
3. Define undo/redo command model.
4. Define design-time data preview.
5. Create examples and fixtures.
6. Implement minimal packages.
7. Build visual designer shell.
8. Add code generation.
9. Add preview runtime.
10. Add REST proxy and advanced integrations.

---

## 6. Current Execution Bias

Current project phase should bias toward M0 and M1.

### M0: Design Schema and Static Designer Prototype

Deliverables:

- initial schema model;
- designer app shell plan;
- widget tree model;
- Object Inspector concept;
- command-based undo/redo model;
- static canvas preview plan;
- static Dart code generation plan;
- login form example.

### M1: Design-Time Data Preview

Deliverables:

- JSON fixture data source spec;
- schema inference rules;
- object binding;
- collection binding;
- ListView item template rules;
- normal/empty/loading/error preview profiles;
- binding validation;
- patient list example.

---

## 7. Repo-Level Done Criteria

A repository task is done only when:

1. The artifact exists in the repo.
2. The artifact has been fetched or otherwise verified after commit.
3. Any ASCII diagram has aligned `|` characters.
4. The commit hash is known.
5. The next useful task is clear.

---

## 8. ASCII Diagram Verification Rule

ASCII diagrams are allowed and encouraged when they clarify architecture.

Rules:

1. Use fenced code blocks with `text`.
2. Use plain ASCII: `+`, `-`, `|`, `>`, `v`, spaces.
3. Every related box line must have `|` at the same column positions.
4. Prefer fixed-width boxes.
5. Do not use Unicode box-drawing characters unless explicitly requested.
6. Do not replace an ASCII diagram with a list when the requested artifact is visual.

Manual check example:

```text
+----------+     +----------+
| Source   | --> | Target   |
| Data     |     | View     |
+----------+     +----------+
```

The vertical bars align at the same columns across the two content rows.

---

## 9. Recommended Next GSD Tasks

Recommended immediate tasks:

1. Create `docs/architecture.md`.
2. Create `docs/schema-format.md`.
3. Create `docs/design-time-data-preview.md`.
4. Create GitHub issue templates for GSD tasks.
5. Add a login form schema example.
6. Add a patient list JSON fixture example.
7. Draft the command-based undo/redo model.

---

## 10. Operating Principle

Prefer a small committed step over a large uncommitted plan.

A good session should end with at least one of these:

- a better document;
- a better schema;
- a better example;
- a better implementation;
- a recorded decision;
- a verified correction.
