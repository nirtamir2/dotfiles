# Schniz-Structure Migration Checklist

## Phase 0: Protect current state

- [ ] Task 1 — Revoke/externalize the hidden npm token and remove `assume-unchanged`.
- [ ] Preserve the dirty `scripts/node.sh` BuilderIO change.
- [ ] Preserve the dirty Karabiner state without IDE/backup files.
- [ ] Create and verify dotfiles/Karabiner Git bundles, patches, branch/stash lists, and export hashes.
- [ ] Task 2 — Create the pre-migration tag and `migration/schniz-structure` branch.
- [ ] Add `schniz` remote pinned at `613bf25` without changing existing remotes.
- [ ] Add `LICENSE`, `UPSTREAM.md`, and the 166/119-entry migration ledger.

### Checkpoint A

- [ ] Inputs are secret-free and independently recoverable.
- [ ] Human review approves the provenance and exclusion policy.

## Phase 1: Build inactive foundation

- [ ] Task 3 — Implement location-independent, dry-run, backed-up, idempotent linking.
- [ ] Add explicit `setup` phases: check, links, packages, macOS, all.
- [ ] Pass Stow simulation and two real link runs against a temporary home.
- [ ] Task 4 — Make `Brewfile` canonical and add optional work/language phases.
- [ ] Account for every Nir/upstream package; remove duplicates and unsafe installers.
- [ ] Preserve the BuilderIO skills addition in `bootstrap/node`.

### Checkpoint B

- [ ] Foundation is green in a temporary home.
- [ ] Real home, packages, services, and macOS defaults are untouched.

## Phase 2: Apply Nir's core overlay

- [ ] Task 5 — Rebuild XDG Git config with Nir's four identity profiles.
- [ ] Task 6 — Port Zsh, aliases, functions, and `_dev` completion.
- [ ] Resolve alias conflicts in Nir's favor and remove duplicate initializers.
- [ ] Task 7 — Merge portable `bin` tools in batches of at most five files.
- [ ] Replace/exclude every upstream binary, absolute link, and broken gitlink.

### Checkpoint C

- [ ] Temporary-home Git identity, interactive shell, and command smoke tests pass.
- [ ] Identity/path scrub is clean outside attribution.

## Phase 3: Editors, terminal, input, and app state

- [ ] Task 8 — Adapt tmux, Ghostty, WezTerm, Alacritty, Starship, borders, and iTerm.
- [ ] Task 9 — Personalize upstream Neovim and decompose safe Cursor/VS Code state.
- [ ] Task 10 — Rewrite OpenCode and AeroSpace; integrate Nir's Karabiner source.
- [ ] Task 11 — Merge stable macOS defaults, with Nir keyboard settings winning.
- [ ] Task 12 — Preserve Raycast source/manual docs and keep opaque exports private.
- [ ] Externally preserve, then remove public `backup.zip`.

### Checkpoint D

- [ ] Every one of the 166 upstream and 119 Nir paths has a final ledger state.
- [ ] No real home-directory change has occurred.

## Phase 4: Retire and validate

- [ ] Task 13 — Remove old `commands/`, `config/`, `scripts/`, dispatcher, IDE files, duplicates, and stale archives only after parity.
- [ ] Confirm the migration ledger has no pending rows.
- [ ] Task 14 — Add fast validation CI instead of full workstation provisioning.
- [ ] Pass shell/config lint, temporary-home linking twice, secret scan, identity scrub, broken-link scan, executable-mode check, and large-file scan.

### Checkpoint E

- [ ] Local validation and CI are green.
- [ ] Human review approves package profiles and canary cutover.

## Phase 5: Canary and cutover

- [ ] Task 15 — Run check/links twice in a fresh macOS user or VM.
- [ ] Back up every real destination and affected macOS defaults domain.
- [ ] Cut over links first; verify a new shell before packages or preferences.
- [ ] Install packages/apps separately; apply macOS defaults last.
- [ ] Rehearse rollback and confirm a second setup run is a no-op.
- [ ] Task 16 — Finish README, upstream update workflow, attribution, and rollback docs.

## Complete

- [ ] All project Definition of Done items in `tasks/plan.md` pass.
- [ ] Migration branch is ready for review; no implementation commit mixes unrelated subsystems.
