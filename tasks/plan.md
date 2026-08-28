# Migration Plan: Schniz Structure with Nir's Configuration

## Outcome

Rebuild `nirtamir2/dotfiles` around the layout and useful tooling from
[`Schniz/dotfiles`](https://github.com/Schniz/dotfiles), while keeping Nir's
identity, workflows, packages, shell behavior, app configuration, and current
machine state authoritative.

This is a **source-structure + Nir-overlay** migration, not a blind fork:

1. Schniz wins directory structure and generic reusable tooling.
2. Nir wins identity, preferences, package choices, paths, keybindings, and app state.
3. Personal, work-specific, machine-specific, compiled, broken, or opaque Schniz
   artifacts are adapted, replaced, quarantined, or explicitly excluded.
4. Nothing is linked into the real home directory until it passes isolated tests.

## Researched Baselines

- Nir repository: `/Users/nirtamir/dotfiles`
  - `primary@289e625fa91af67558d1eb970bef6a1abbab5c1e`
  - 119 tracked entries
  - `origin/primary` matches local `primary`
  - Existing remotes `upstream` and `modestfake` must be preserved.
- Schniz repository:
  - `master@613bf25f56ced0fac4f119959dee99b1c1d4be1c`
  - 166 tracked entries, about 39.4 MB
  - MIT licensed; its full notice must be preserved.
- Additional user inputs in `/Users/nirtamir/dev/dotfiles`:
  - `Cursor Default.code-profile` from 2026-03-05; it is an older candidate.
  - Raycast exports from 2026-07-05 and 2026-07-11
- Current Cursor source of truth:
  - `/Users/nirtamir/dotfiles/.vscode/Cursor Default.code-profile` from
    2026-03-14, with 118 extensions. It supersedes the 117-extension workspace
    export; neither file's global state should be carried forward.
- Current dirty state that must be preserved:
  - `/Users/nirtamir/dotfiles/scripts/node.sh` adds `builderio/skills`.
  - `/Users/nirtamir/dev/work/karabiner/karabiner.json` is modified, with
    untracked IDE and automatic-backup files.
  - The dotfiles repository also has old branches and stashes; a complete Git
    bundle is required before restructuring.

## Security Stop Before Migration

`config/home/.npmrc` has a live-looking token in the working tree, differs from
the safe committed blob, and is hidden from normal status by Git's
`assume-unchanged` bit. Do not bulk-add, copy, archive, or import this file.

Before implementation:

1. Rotate/revoke the token through the package registry.
2. Move the replacement into an external secret source such as `~/.secrets`,
   Keychain, or a password-manager CLI.
3. Make the tracked `.npmrc` contain only public settings and an environment
   reference such as `${NPM_TOKEN}`.
4. Remove `assume-unchanged` and verify `git status` can report future changes.
5. Exclude `.idea/shelf/mixtiles_token`, `.opencode` databases, Cursor storage,
   and `backup.zip` from every migration archive and commit.

No structural migration should begin before this gate is complete.

## Architecture Decisions

### Repository and history

- Keep Nir's existing Git history and first-parent lineage.
- Add a new `schniz` remote; do not replace the existing `upstream` remote.
- Pin Schniz commit `613bf25` in `UPSTREAM.md`.
- Import a reviewed snapshot, not an unrelated-history merge. This avoids
  permanently importing roughly 37 MB of compiled binaries and broken links.
- Maintain a ledger for every one of Schniz's 166 entries and every one of
  Nir's 119 tracked entries: `keep`, `adapt`, `replace`, `retire`, `externalize`,
  or `quarantine`.
- Make separate commits for scaffold, Nir overlay, personalization, cleanup,
  validation, and cutover support so each stage is reversible.

### Installation and linking

- `.config/` is stowed into `${XDG_CONFIG_HOME:-$HOME/.config}`.
- Root files (`.zshrc`, `.vimrc`, `.npmrc`, `aliases`, `bin`, `.jq`) are linked
  by `bootstrap/links`.
- Every script derives the repository root from its own location. No
  `~/Code/dotfiles`, `~/dotfiles`, or `/Users/...` assumption is allowed.
- `setup` uses explicit phases: `--check`, `--links-only`, `--packages`,
  `--macos`, and `--all`. Running it without a phase shows help.
- Linking reports conflicts, backs up real files, supports dry-run, and is
  idempotent. It never invokes `stow --adopt` automatically.
- Package installation and macOS mutations are never part of validation CI.

### Ownership rules

- Nir's Git identities, signing policy, aliases, shell functions, keyboard
  behavior, Dock settings, Raycast commands, Karabiner rules, and editor profile
  win on conflict.
- Schniz's generic Ghostty, tmux, Starship, WezTerm, Neovim, CLI, and Stow ideas
  are retained where they are portable and still useful.
- Schniz-specific identities, Vercel routes, app/device IDs, branch prefixes,
  OpenCode persona, secrets integration, and `/Users/schniz` paths are replaced.
- Compiled Mach-O files and absolute symlinks are not copied. A package install,
  source build, portable wrapper, or documented exclusion replaces each one.
- Opaque Raycast/Cursor exports remain private unless their contents and privacy
  implications are explicitly accepted.

### Package ownership

- `Brewfile` is the canonical common/personal Homebrew manifest.
- `Brewfile.work` contains optional work-only tools and apps.
- `bootstrap/node`, `bootstrap/go`, `bootstrap/rust`, and `bootstrap/pip` manage
  non-Homebrew ecosystems and must be independently runnable and idempotent.
- Source-only paid, employer-specific, and service-specific apps are recorded
  but not installed by default.

## Desired Structure

```text
dotfiles/
├── .config/                       # Stowed to ~/.config
│   ├── .stowrc
│   ├── aerospace/                 # Schniz base, Nir app routing
│   ├── alacritty/
│   ├── borders/
│   ├── ghostty/
│   ├── git/
│   │   ├── config
│   │   ├── ignore
│   │   ├── attributes
│   │   └── profiles/              # Nir's conditional identities
│   ├── karabiner/                 # Nir's own config, not Gal's device IDs
│   ├── nvim/                      # Personalized Schnizvim configuration
│   ├── opencode/                  # Sanitized and rewritten for Nir
│   ├── tmux/
│   ├── wezterm/
│   ├── starship.toml
│   └── stylua.toml
├── .github/workflows/validate.yml
├── .jq/
├── aliases
├── bin/
├── bootstrap/
│   ├── homebrew
│   ├── installations
│   ├── links
│   ├── node
│   ├── go
│   ├── rust
│   ├── pip
│   ├── editors
│   └── work
├── editors/
│   ├── cursor/
│   └── vscode/
├── iterm/
├── macos-defaults/
├── manual-install/
├── raycast/
│   ├── extensions/
│   └── scripts/
├── raycast-export/                # Private by default
├── zsh-completions/
├── zsh-functions/
├── .gitignore
├── .npmrc                         # No token; environment reference only
├── .rgignore
├── .vimrc
├── .zshrc
├── Brewfile
├── Brewfile.work
├── LICENSE
├── README.md
├── UPSTREAM.md
├── setup
└── tmux.terminfo
```

## File Mapping and Conflict Policy

| Nir source | Destination | Policy |
|---|---|---|
| `config/home/.zshrc` | `.zshrc` | Use Schniz's loader shape; port Nir's options, history-aware `lc`, PATH intent, fnm, pnpm, McFly, OpenCode, Worktrunk, and Vite+ behavior. Remove duplicates and hard-coded user paths. Use one plugin manager. |
| `config/oh-my-zsh/aliases.zsh` | `aliases` | Semantic merge. Nir wins for `f`, `t`, `p`, `cat`, and `cdgr`; rename conflicting upstream abbreviations. |
| `config/oh-my-zsh/functions.zsh` | `zsh-functions/nir` initially | Preserve behavior as one file first; split by domain only after parity tests. |
| `config/oh-my-zsh/completions/_dev` | `zsh-completions/_dev` | Add to `fpath` before `compinit`. |
| `config/oh-my-zsh/*theme*` | retire | Starship is already the active prompt. |
| `config/.bin/*` | `bin/*` | Union with portable upstream scripts; keep one `gitroot`; preserve executable modes. Import in review batches of at most five files. |
| `config/home/.gitconfig` | `.config/git/config` | Rebuild rather than line-merge. Nir identity, aliases, delta settings, include paths, and signing policy win. |
| `config/home/git-configs/*` | `.config/git/profiles/*` | Preserve all four conditional identities and fix include paths. |
| `config/home/.gitignore_global` | `.config/git/ignore` | Union and deduplicate. |
| `config/home/.gitattributes` | `.config/git/attributes` | Remove the absolute-path credential filter; set `core.attributesfile`. |
| `config/home/.npmrc` | `.npmrc` | Public settings and environment reference only; externalize and rotate the token. |
| `config/home/.vimrc` | `.vimrc` | Preserve still-used behavior; make the personalized Schniz Neovim config primary. |
| `scripts/brew.sh`, `scripts/cask.sh`, MAS entries | `Brewfile` | Curated union; remove duplicates, invalid formulae, obsolete flags, forced uninstalls, and personalized `curl | sh`. |
| `scripts/node.sh` | `bootstrap/node` | Preserve all current tools/skills, including the unstaged BuilderIO addition. |
| `scripts/{go,rust,pip}.sh` | matching `bootstrap/*` | Optional idempotent phases. |
| `scripts/work-only.sh` | `Brewfile.work` / `bootstrap/work` | Opt-in only. |
| `scripts/code.sh` and package lists | `bootstrap/editors`, `editors/*` | Prefer the current Cursor profile; preserve declarative extension lists. |
| `scripts/mac.sh`, `macos-defaults/*` | `macos-defaults/*` | Merge stable keys only. Nir keyboard timings win. Remove volatile Dock capture data. |
| `config/com.googlecode.iterm2.plist` | `iterm/com.googlecode.iterm2.plist` | Nir export wins, after removing stale Stefan paths. |
| `raycast/my-stuff`, `raycast/scripts` | `raycast/extensions`, `raycast/scripts` | Preserve user-owned source and move credentials to Raycast preferences or secrets. |
| latest Raycast export | `raycast-export/` | July 11 is the likely current export; retain July 5 privately until restore is verified. |
| Cursor profile | `editors/cursor/` | Decompose settings, keybindings, snippets, and extension IDs; do not commit global state or permission-bypass state. |
| `manual-install/*` | `manual-install/*` | Keep Nir's ergonomic setup docs; prune only after manual parity review. |
| `static/fira-code-iscript/*` | package install or `static/` | Prefer a maintained font package; retain files only if no equivalent exists. |
| `.my-config.sample` | `.secrets.example` | Document variable names only. Real secrets live outside Git. |
| `.my-config` | remove | It duplicates the sample and must not be a secret-storage pattern. |
| `backup.zip` | external encrypted backup | Remove from public Git after off-repo preservation; never migrate it into the new tree. |
| `.idea/*` | remove from tracking | IDE project metadata is not a dotfiles payload. |
| old `commands/`, `config/`, `scripts/`, `dotfiles` | retire after parity | Keep until every ledger row is accounted for and replacement tests pass. |

## Upstream Items That Must Not Be Copied Verbatim

- Git name/email/signing key, GitHub assignee `Schniz`, and 1Password setup.
- `/Users/schniz`, `/Users/galsc`, `~/Code/dotfiles`, Vercel paths, app routing,
  keyboard device IDs, and branch prefix rules.
- `.config/opencode/AGENTS.md` and broad personal OpenCode permissions.
- Schniz's iTerm and Raycast exports.
- Stale Fish/OMF and Oh My Zsh remnants unless the ledger proves a live use.
- `bin/SourceKittenDaemon`, `bin/langserver-swift`, `bin/merged_branches`,
  `bin/python`, `bin/reason-language-server`, and `bin/scry` compiled binaries.
- Broken absolute links `deploy-single-file`, `which_js_formatter`, `python`, and
  `timeout`.
- Broken Oh My Zsh plugin gitlinks that have no `.gitmodules` entries.
- Deprecated Homebrew installer, undefined `sudo-touchid`, private macOS
  `activateSettings` path, and full GUI/MAS provisioning in CI.
- Binary `symbolichotkeys.plist` until converted to reviewed declarative intent.

## Task Plan

### Phase 0: Protect Current State

#### Task 1: Remove credential and dirty-state risk

**Description:** Make the current repositories safe to restructure without
losing hidden credentials, local changes, branches, stashes, or staged exports.

**Acceptance criteria:**

- [ ] The live-looking npm token is revoked/rotated and absent from the dotfiles working tree.
- [ ] `assume-unchanged` is removed from `.npmrc`; the tracked file contains no secret.
- [ ] The Node/BuilderIO change and dirty Karabiner state are captured in named patches or commits.
- [ ] A full dotfiles Git bundle, a Karabiner bundle, branch list, stash list, and export hashes are stored outside both repositories.
- [ ] The Git bundles verify successfully.

**Verification:**

- [ ] Secret scanner reports no token in tracked or staged content.
- [ ] `git ls-files -v config/home/.npmrc` no longer starts with `h`.
- [ ] `git bundle verify` succeeds for both repositories.
- [ ] SHA-256 hashes exist for both 2026 Raycast exports and the Cursor profile.

**Dependencies:** None

**Files likely touched:** `.gitignore`, `config/home/.npmrc`, `.secrets.example`

**Estimated scope:** Small

#### Task 2: Create the migration branch and provenance ledger

**Description:** Establish a reproducible migration boundary and account for
both repositories without merging Schniz's binary-heavy history.

**Acceptance criteria:**

- [ ] Annotated pre-migration tag and `migration/schniz-structure` branch exist.
- [ ] A `schniz` remote is added without changing `origin`, `upstream`, or `modestfake`.
- [ ] `UPSTREAM.md` records Schniz SHA `613bf25`, source URL, license, import policy, and future update process.
- [ ] Every Schniz and Nir tracked path is represented in the migration ledger.
- [ ] Schniz's complete MIT notice is present.

**Verification:**

- [ ] Ledger counts reconcile to 166 upstream and 119 target entries.
- [ ] No compiled binary or broken absolute symlink is staged.
- [ ] `git diff --cached --check` passes.

**Dependencies:** Task 1

**Files likely touched:** `LICENSE`, `UPSTREAM.md`, `tasks/migration-ledger.tsv`

**Estimated scope:** Medium

### Checkpoint A: State is recoverable

- [ ] No credential is present in the migration inputs.
- [ ] Bundles, patches, tag, export hashes, and ledger are independently verified.
- [ ] Stop and review before changing layout.

### Phase 1: Build the Inactive Foundation

#### Task 3: Implement safe setup and linking

**Description:** Adapt Schniz's bootstrap structure into a location-independent,
dry-runnable, conflict-aware installer. Do not activate it against the real home
directory yet.

**Acceptance criteria:**

- [ ] `setup` supports `--check`, `--links-only`, `--packages`, `--macos`, and `--all`.
- [ ] `bootstrap/links` handles both XDG and root files, derives `ROOT_DIR`, and backs up conflicts.
- [ ] Re-running links makes no changes and never deletes unrelated directories.
- [ ] Homebrew uses the current official installer only when Brew is missing.
- [ ] Missing optional tools and private macOS APIs are guarded, not fatal.

**Verification:**

- [ ] Stow simulation succeeds against a temporary home.
- [ ] Actual linking succeeds twice against a temporary home with identical results.
- [ ] `bash -n` and ShellCheck pass for the changed scripts.
- [ ] Conflict and rollback fixtures pass without touching the real home.

**Dependencies:** Task 2

**Files likely touched:** `setup`, `bootstrap/homebrew`, `bootstrap/installations`, `bootstrap/links`, `.config/.stowrc`

**Estimated scope:** Medium

#### Task 4: Consolidate package and language provisioning

**Description:** Replace parallel install lists with one curated package source
and explicit optional ecosystem phases.

**Acceptance criteria:**

- [ ] `Brewfile` contains the deduplicated common/personal union.
- [ ] `Brewfile.work` contains Slack/Teams and other work-only choices.
- [ ] Every current Nir package and every upstream package has a ledger decision.
- [ ] Node tools and agent skills preserve the BuilderIO addition.
- [ ] Invalid or unsafe entries (`ffmeg`, obsolete ffmpeg flags, forced VS Code uninstall, personalized Texts installer) are removed or documented as manual.

**Verification:**

- [ ] `brew bundle check --file Brewfile` parses and reports only expected missing packages.
- [ ] Each language bootstrap supports a check/dry-run mode and passes shell lint.
- [ ] Duplicate formula, cask, MAS, and global Node package detection returns zero.

**Dependencies:** Task 3

**Files likely touched:** `Brewfile`, `Brewfile.work`, `bootstrap/installations`, `bootstrap/node`, `bootstrap/work`

**Estimated scope:** Medium

### Checkpoint B: Foundation is safe but inactive

- [ ] Setup is tested only against a temporary home.
- [ ] Package and macOS phases remain opt-in.
- [ ] No real symlink, package, service, or default has changed.

### Phase 2: Apply Nir's Core Overlay

#### Task 5: Rebuild Git configuration around Nir's identities

**Description:** Use Schniz's XDG Git location while preserving Nir's aliases,
conditional identities, signing behavior, delta setup, and global ignore.

**Acceptance criteria:**

- [ ] Gal/Schniz identity, key, assignee, and credential helper choices are absent.
- [ ] Home, News Spectator, Youleap, and Genie Labs profiles resolve for representative repository paths.
- [ ] Global attributes no longer depend on an absolute path or secret-clean filter.
- [ ] Credentials remain external to Git.

**Verification:**

- [ ] `git config --file .config/git/config --list` parses.
- [ ] `git config --show-origin user.email` returns the expected redacted profile in test repositories.
- [ ] Git aliases used by Nir resolve without missing `bin` dependencies.
- [ ] Identity scrub passes except for attribution files.

**Dependencies:** Tasks 3-4

**Files likely touched:** `.config/git/config`, `.config/git/ignore`, `.config/git/attributes`, `.config/git/profiles/*`

**Estimated scope:** Medium

#### Task 6: Migrate shell, aliases, functions, and completions

**Description:** Adopt the source-style root Zsh layout while preserving Nir's
interactive behavior and removing duplicated or stale initialization.

**Acceptance criteria:**

- [ ] One plugin manager, one fnm init, one Starship init, and one zoxide init remain.
- [ ] Nir's aliases/functions are present and conflicts follow the mapping table.
- [ ] `lc`, project script selection, Git helpers, OCR/media helpers, port helpers, and custom file commands remain usable.
- [ ] `_dev` completion loads through `fpath`; Fig-era blocks are removed unless still installed.
- [ ] No literal `/Users/nirtamir`, `/Users/schniz`, or checkout-location path remains.

**Verification:**

- [ ] `zsh -n` passes on every shell file.
- [ ] `HOME=<temp> zsh -df -c 'source ./.zshrc'` completes without a fatal error.
- [ ] Interactive smoke tests confirm representative aliases/functions and completion.
- [ ] Shell startup time is recorded and does not materially regress.

**Dependencies:** Tasks 3 and 5

**Files likely touched:** `.zshrc`, `aliases`, `zsh-functions/nir`, `zsh-completions/_dev`, `.secrets.example`

**Estimated scope:** Medium

#### Task 7: Merge portable command-line helpers

**Description:** Combine Nir's 19 helper commands with Schniz's portable text
scripts while excluding binaries and broken links. Review/move commands in
batches of no more than five files per commit.

**Acceptance criteria:**

- [ ] Every `config/.bin` and upstream `bin` entry has a ledger decision.
- [ ] `gitroot` is deduplicated and Nir's unusual `$` helper is explicitly retained or retired.
- [ ] Every retained script has an interpreter, executable mode, and declared dependency.
- [ ] Compiled binaries and absolute symlinks have a package/wrapper/exclusion decision.

**Verification:**

- [ ] No broken links exist under `bin/`.
- [ ] `file bin/*` reports only intended portable content.
- [ ] `bash -n`/`sh -n`, ShellCheck, and focused command smoke tests pass.
- [ ] `command -v` finds all commands required by Git aliases and shell functions in a temporary home.

**Dependencies:** Tasks 4-6

**Files likely touched:** `bin/*`, `tasks/migration-ledger.tsv`

**Estimated scope:** Medium, implemented as small review batches

### Checkpoint C: Core terminal workflow has parity

- [ ] Temporary-home Git identity selection works.
- [ ] A clean interactive Zsh starts and representative Nir workflows pass.
- [ ] No upstream personal identity/path survives outside attribution.

### Phase 3: Editors, Terminal, Input, and Application State

#### Task 8: Adapt terminal and tmux configuration

**Description:** Import portable Ghostty, WezTerm, Alacritty, Starship, borders,
and tmux settings, then overlay Nir's terminal choices and path conventions.

**Acceptance criteria:**

- [ ] Tmux no longer references `~/Code/dotfiles` or source-only scripts.
- [ ] Nir's iTerm plist is regenerated/sanitized; Stefan/Gal paths are gone.
- [ ] Terminal themes and keybindings are reviewed for conflicts with Nir's shell and macOS shortcuts.
- [ ] TPM/plugin installation is explicit and idempotent.

**Verification:**

- [ ] Tmux loads the config in an isolated server.
- [ ] Ghostty config validation passes when Ghostty is installed.
- [ ] `plutil -lint` passes for the iTerm plist.
- [ ] Path/identity scrub passes.

**Dependencies:** Tasks 6-7

**Files likely touched:** `.config/tmux/*`, `.config/ghostty/*`, `.config/wezterm/*`, `iterm/com.googlecode.iterm2.plist`, `tmux.terminfo`

**Estimated scope:** Medium

#### Task 9: Adopt Neovim and sanitize Cursor/VS Code state

**Description:** Make Schniz's current Neovim setup Nir's primary tracked
editor config and preserve only declarative Cursor/VS Code state.

**Acceptance criteria:**

- [ ] `.config/schnizvim` is adapted to standard `.config/nvim` or a deliberate Nir-specific app name.
- [ ] Source-specific module names, profiles, markers, and paths are renamed or documented.
- [ ] The current Cursor settings, keybindings, snippets, and extension IDs are retained.
- [ ] Cursor global state, personal identifiers, permission-bypass state, histories, and databases are excluded.
- [ ] The stale 28-extension list and duplicate profile are retired only after parity comparison.

**Verification:**

- [ ] Neovim starts headlessly without config errors.
- [ ] Lua formatting/checks and JSON parsing pass.
- [ ] Cursor profile can be reconstructed/imported from tracked declarative files.
- [ ] Extension parity report explains every addition/removal.

**Dependencies:** Tasks 4 and 6

**Files likely touched:** `.config/nvim/*`, `editors/cursor/*`, `editors/vscode/*`, `bootstrap/editors`

**Estimated scope:** Medium, implemented as small review batches

#### Task 10: Personalize OpenCode, AeroSpace, and Karabiner

**Description:** Retain reusable upstream configuration while replacing Gal's
persona, permissions, app routing, keyboard devices, and work conventions with
Nir's current setup.

**Acceptance criteria:**

- [ ] OpenCode agent instructions name Nir or are generic; broad permissions are explicitly reviewed.
- [ ] AeroSpace contains only apps/workspaces Nir uses.
- [ ] Nir's real Karabiner source wins; dirty generated config is preserved before integration.
- [ ] Karabiner is imported as reviewed source/subtree rather than a broken gitlink; IDE and automatic backups are excluded.
- [ ] Secrets and service credentials remain external.

**Verification:**

- [ ] JSON/TOML/package files parse and Karabiner rebuild output is reproducible.
- [ ] No Gal/Vercel/device-ID residue remains unless deliberately documented.
- [ ] Stow simulation reports no collision with the current external Karabiner symlink.
- [ ] Manual app-routing and Hyper-key smoke tests pass on the canary account.

**Dependencies:** Tasks 3, 6, and 9

**Files likely touched:** `.config/opencode/*`, `.config/aerospace/*`, `.config/karabiner/*`, `.gitignore`

**Estimated scope:** Medium, implemented as small review batches

#### Task 11: Merge stable macOS defaults

**Description:** Combine both default sets by intent, excluding volatile dumps
and delaying actual application until the final canary.

**Acceptance criteria:**

- [ ] Nir keyboard values win: `KeyRepeat=1`, `InitialKeyRepeat=15`, and press-and-hold disabled.
- [ ] Dock contains only stable desired keys; timestamps, locale, counters, serialized Arc bookmark, and capture noise are gone.
- [ ] Source Safari/trackpad/status-bar settings are reviewed individually.
- [ ] Symbolic hotkeys are declarative/reviewed or excluded.
- [ ] A pre-apply export and rollback procedure exists for every affected domain.

**Verification:**

- [ ] `macos-defaults --dry-run apply ./macos-defaults` succeeds.
- [ ] YAML parses and duplicate domain/key detection returns zero.
- [ ] No private framework command is required for validation.

**Dependencies:** Task 3

**Files likely touched:** `macos-defaults/*`, `bootstrap/macos`

**Estimated scope:** Medium

#### Task 12: Preserve Raycast and manual user assets safely

**Description:** Keep Nir's Raycast source and setup documentation while
treating opaque exports as private restore artifacts.

**Acceptance criteria:**

- [ ] Raycast extension and scripts retain Nir authorship and no hard-coded credentials.
- [ ] The stale Stefan/Contentful material has an explicit keep/retire decision.
- [ ] July 11 is tested as the current export; July 5 remains private until restore succeeds.
- [ ] Manual setup docs are linked from README and stale app instructions are marked.
- [ ] `backup.zip` is removed from the public tree after verified external preservation.

**Verification:**

- [ ] Raycast TypeScript package builds/lints.
- [ ] Shell/JavaScript Raycast scripts pass static checks and representative manual tests.
- [ ] Secret scan covers source and export filenames; opaque payloads are not published by default.
- [ ] Markdown link/image check passes.

**Dependencies:** Tasks 1 and 4

**Files likely touched:** `raycast/*`, `raycast-export/*`, `manual-install/*`, `README.md`, `.gitignore`

**Estimated scope:** Medium, implemented as small review batches

### Checkpoint D: Full configuration parity

- [ ] Every upstream and Nir path has a final ledger state.
- [ ] Shell, Git, commands, editors, terminal, input, app, and macOS behavior have owners and tests.
- [ ] No real home-directory change has occurred.

### Phase 4: Retire the Old Layout and Prove It

#### Task 13: Remove superseded and unsafe legacy material

**Description:** Delete the old dispatcher and duplicate layout only after all
ledger rows point to verified replacements or deliberate retirement decisions.

**Acceptance criteria:**

- [ ] `commands/`, `config/`, `scripts/`, and `dotfiles` have zero unaccounted functionality.
- [ ] `.idea`, duplicate `.my-config`, stale exports/lists, empty package lists, old prompt/theme remnants, and `backup.zip` are removed or externalized.
- [ ] No ignored secret/cache/database path can be accidentally force-added.
- [ ] All retained source files have a clear runtime owner.

**Verification:**

- [ ] Migration ledger has no `pending` rows.
- [ ] Old-vs-new behavior checklist is complete.
- [ ] `git diff --check`, broken-link scan, large-file scan, and secret scan pass.

**Dependencies:** Tasks 5-12

**Files likely touched:** legacy `commands/`, `config/`, `scripts/`, `.idea/`, `backup.zip`, `.gitignore`

**Estimated scope:** Medium, implemented as small deletion batches

#### Task 14: Replace provisioning CI with validation CI

**Description:** Validate the repository without attempting six-hour GUI,
Homebrew, MAS, or macOS provisioning on every push.

**Acceptance criteria:**

- [ ] CI uses a current checkout action and runs fast deterministic validation.
- [ ] Shell lint/syntax, JSON/plist/YAML checks, Stow simulation, secret scan, executable-mode checks, broken-link checks, and identity scrub run on push/PR.
- [ ] Temporary-home linking is tested twice for idempotency.
- [ ] Full provisioning is a separate manual workflow or documented canary procedure.

**Verification:**

- [ ] Local validation script passes.
- [ ] CI passes on the migration branch within a bounded time.
- [ ] CI cannot alter a real user home, install MAS apps, or apply macOS defaults.

**Dependencies:** Task 13

**Files likely touched:** `.github/workflows/validate.yml`, `bin/validate-dotfiles`, validation fixtures

**Estimated scope:** Medium

### Checkpoint E: Ready for canary

- [ ] Repository validation and CI are green.
- [ ] Secret, identity, binary, link, and large-file scans are clean.
- [ ] Human review approves package profiles and destructive boundaries.

### Phase 5: Canary, Cutover, and Maintenance

#### Task 15: Test a fresh user and cut over in stages

**Description:** Prove the setup in a fresh macOS user/VM, then switch the real
account with a timestamped backup and links-only first.

**Acceptance criteria:**

- [ ] Fresh-user `--check` and `--links-only` pass twice.
- [ ] Interactive Zsh, Git profiles, core commands, editor, terminal, Raycast, and Karabiner smoke tests pass.
- [ ] Every real destination is copied to `~/.dotfiles-backup/<timestamp>` with a link manifest.
- [ ] Real cutover order is links-only, shell verification, packages, app imports, then macOS defaults last.
- [ ] Rollback restores links/files and macOS domains without relying on Git checkout alone.

**Verification:**

- [ ] New terminal session works before closing the old session.
- [ ] Representative daily workflows pass on the real account.
- [ ] Second setup run is a no-op.
- [ ] Rollback rehearsal succeeds on the canary account.

**Dependencies:** Task 14 and explicit human approval

**Files likely touched:** no repository files unless canary fixes are required

**Estimated scope:** Medium

#### Task 16: Document use and future upstream updates

**Description:** Make the resulting repository understandable and keep future
Schniz changes reviewable without re-running the transplant.

**Acceptance criteria:**

- [ ] README documents prerequisites, safe setup phases, profiles, secret handling, backup, restore, and manual steps.
- [ ] `UPSTREAM.md` documents the pinned SHA, exclusions, attribution, and selective update workflow.
- [ ] Future update procedure is `fetch -> diff old SHA..new SHA -> update ledger -> selectively port -> validate`; no automatic merge.
- [ ] The full MIT notice remains intact and retained legacy lineage is attributed rather than silently relicensed.

**Verification:**

- [ ] A reader can perform links-only setup and rollback using README alone.
- [ ] Documentation commands pass lint/link checks.
- [ ] Final repository and working tree status are reviewed.

**Dependencies:** Task 15

**Files likely touched:** `README.md`, `UPSTREAM.md`, `LICENSE`

**Estimated scope:** Small

## Rollback Strategy

1. Git rollback: keep the annotated pre-migration tag and verified bundle.
2. Link rollback: remove only symlinks whose resolved targets are inside this
   repository; never recursively delete destination directories.
3. File rollback: restore timestamped originals from
   `~/.dotfiles-backup/<timestamp>` using the recorded manifest.
4. Shell rollback: keep the old terminal session open until a new login shell
   passes; restore `.zshrc` first if startup fails.
5. macOS rollback: export each affected defaults domain before applying and
   restore those exports independently.
6. Package rollback: Git cannot uninstall packages or reverse services. Record
   `brew bundle dump` before provisioning and review removals manually.
7. App-state rollback: keep the previous Raycast/Cursor exports privately until
   the new import is verified.

## Risks and Mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Hidden npm token is staged during a bulk move | Critical | Rotate first, externalize it, remove `assume-unchanged`, and scan every staged commit. |
| Linking deletes or replaces live configuration | High | Temporary-home tests, dry-run, conflict backups, no automatic `--adopt`, links-only cutover. |
| Schniz setup is treated as proven | High | Rebuild the orchestration; its recent workflows cancel during setup and root links are not installed. |
| Source identity/work configuration leaks into Nir's setup | High | Rebuild Git/OpenCode/AeroSpace/Karabiner configs and run a mandatory identity/path scrub. |
| Opaque exports include credentials or private state | High | Keep private by default; prefer declarative settings and manual restore docs. |
| Compiled Intel binaries fail or bloat history | High | Do not import them; use package/source replacements or explicit exclusions. |
| Package union installs unwanted paid/work apps | Medium | Common/personal/work profiles with source-only apps opt-in. |
| Current shell behavior is lost during cleanup | Medium | Port first, parity-test, then retire old files; one domain per review batch. |
| macOS defaults are hard to reverse | Medium | Stable keys only, dry-run, per-domain exports, apply last. |
| Licensing/provenance becomes unclear | Medium | Preserve Schniz MIT notice, pinned SHA, full ledger, and lineage attribution. |
| Future upstream sync repeats the migration | Low | Selective diff workflow recorded in `UPSTREAM.md`; no automatic merge. |

## Recommended Defaults for Open Decisions

- Keep source-only paid/work apps optional, not part of the default profile.
- Keep Raycast and Cursor opaque exports private; commit declarative source only.
- Integrate Nir's Karabiner project as reviewed source/subtree after preserving its
  dirty state; do not use another unconfigured gitlink.
- Make the personalized upstream Neovim configuration standard `.config/nvim`;
  retire the old legacy Vim/CoC bridge after parity.
- Preserve Nir's history and import a pinned reviewed snapshot; do not merge
  unrelated histories.

## Project Definition of Done

- [ ] All 166 Schniz entries and 119 Nir entries have final ledger decisions.
- [ ] No tracked/staged secret, opaque private state, broken symlink, or imported compiled binary remains.
- [ ] No active Gal/Schniz/Stefan identity or hard-coded `/Users/...` path remains outside attribution and tests.
- [ ] Nir's Git identities, shell workflows, commands, packages, editor state, Raycast source, Karabiner behavior, and macOS preferences have parity tests.
- [ ] Setup is location-independent, explicit, backed up, dry-runnable, idempotent, and reversible at the link/config layer.
- [ ] Validation CI passes without provisioning a workstation.
- [ ] Fresh-user canary and staged real-account cutover succeed.
- [ ] README, license, upstream provenance, secret model, and rollback procedure are complete.
