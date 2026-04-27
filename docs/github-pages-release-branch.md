# GitHub Pages deployment from `release` branch

This repository is configured to run Flutter web test/build/deploy when code is pushed to the `release` branch.

## Workflow location

- `.github/workflows/deploy_flutter_web.yml`

## Trigger

- push to `release`
- manual trigger via `workflow_dispatch`

## Notes

- The workflow expects your Flutter app in `app/`.
- It builds with `--base-href /flutter-form-designer/`.
- If repository name changes, update the base href in workflow.
