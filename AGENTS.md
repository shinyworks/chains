# AGENTS.md

## Repository overview

**chains** — Complex Reactive Values for 'shiny'

Create hybrid reactive objects (`vrv`) that can be set imperatively
but are validated reactively, ensuring their state is always
consistent with their dependencies. Bridges the gap between
`reactiveVal()` (imperative) and `reactive()` (declarative).

https://chains.shinyworks.org, https://github.com/shinyworks/chains

### Overall structure

```
chains/
├── R/                          # R source code (one file ≈ one exported function)
├── tests/testthat/             # Unit + integration tests
├── man/                        # Auto-generated roxygen2 documentation
├── vignettes/articles/         # pkgdown articles (e.g. cascading_inputs.qmd)
├── inst/
│   ├── apps/                   # Shiny example apps
│   └── slides/                 # Presentation materials
├── .github/
│   ├── ISSUE_TEMPLATE/         # GitHub issue templates
│   ├── skills/                 # Agent skill definitions
│   └── workflows/              # CI/CD (R-CMD-check, pkgdown, codecov)
├── DESCRIPTION                 # Package metadata
├── NAMESPACE                   # Auto-generated exports
├── NEWS.md                     # Changelog
└── AGENTS.md                   # This file
```

### Key files

| File | Purpose |
|------|---------|
| `R/validated_reactive_val.R` | Core `validated_reactive_val()` — creates `vrv` objects |
| `R/pronoun.R` | `.vrv()` pronoun — access the current (unvalidated) value inside a validation expression |
| `R/extract_error.R` | `extract_error()` generic + `vrv` method |
| `R/is_default.R` | `is_default()` generic + `vrv` method |
| `R/vrv_chr.R` | `vrv_chr()` / `vrv_chr_scalar()` — character wrappers |
| `R/vrv_dbl.R` | `vrv_dbl()` / `vrv_dbl_scalar()` — double wrappers |
| `R/vrv_int.R` | `vrv_int()` / `vrv_int_scalar()` — integer wrappers |
| `R/vrv_lgl.R` | `vrv_lgl()` / `vrv_lgl_scalar()` — logical wrappers |
| `R/vrv_fct.R` | `vrv_fct()` / `vrv_fct_scalar()` — factor-like character wrappers |
| `R/vrv_from_function.R` | Internal factory: builds typed wrappers from a `stbl` validation fn |
| `R/aaa-conditions.R` | Internal error/condition helpers |
| `R/aaa-shared_params.R` | Shared roxygen2 `@param` tags |
| `R/aaa-utils.R` | Small internal utilities |

---

## Standard workflow

For any feature, fix, or refactor:

1. **Update packages**: `pak::pak()`
2. **Run tests** — confirm passing before changes: `devtools::test(reporter = "check")`. If any fail, stop and ask.
3. **Plan** — identify affected R files; check if new exports are needed.
4. **Test first** — write failing test, then implement: `devtools::test(filter = "name", reporter = "check")`.
5. **Implement** — minimal code to pass tests.
6. **Refactor** — clean up, keep tests green.
7. **Document** — document any new or changed exports.
8. **Verify**: Run `devtools::test(reporter = "check")`, then `devtools::check(error_on = "warning")`. Resolve warnings, errors, and NOTEs.
9. **News** — add bullet at top of `NEWS.md` (under dev heading):
   - User-facing changes only. 1 line, end with `.`
   - Present tense, positive framing, function names (backticks + `()`) near start: `` * `fn()` now accepts ... `` not `* Fixed ...`
   - Issue/contributor before final period: `` * `fn()` now accepts ... (@user, #N). `` where `#N` is the GitHub issue number being implemented (e.g. `#42`).
   - Get username: `gh api user --jq .login`; get issue number from the user's prompt, the branch name (`git branch --show-current`), or `gh issue list`.
   - **Never guess or invent an issue number.** Before writing it, verify: (1) you received it from the user or the branch name, OR (2) you looked it up with `gh`. If you cannot trace the number to a concrete source, use `#noissue`.

---

## General

- R console: use `--quiet --vanilla`.
- Always run `air format .` after generating R code.
- Comments explain *why*, not *what*.

## Skills

| Triggers | Path |
|----------|------|
| create GitHub issues | @.github/skills/create-issue/SKILL.md |
| document functions | @.github/skills/document/SKILL.md |
| from github | @.github/skills/github/SKILL.md |
| implement issue / work on #NNN | @.github/skills/implement-issue/SKILL.md |
| writing R functions / API design / error handling | @.github/skills/r-code/SKILL.md |
| search / rewrite code | @.github/skills/search-code/SKILL.md |
| writing or reviewing tests | @.github/skills/tdd-workflow/SKILL.md |
