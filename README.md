# Jetify Devbox Plugins

A collection of reusable [Jetify Devbox](https://www.jetify.com/devbox/) plugins for consistent development-shell environments.

## Available plugins

| Plugin | Description |
| --- | --- |
| [`zsh-environment`](./zsh-environment/) | A Zsh-based interactive shell with Starship, tmux, and practical command-line utilities. |

## Use a plugin from GitHub

Add a plugin to the `include` array in your project's `devbox.json`. The example below uses the repository's `main` branch and the `zsh-environment` plugin directory:

```json
{
  "include": [
    "github:geoffh1977-org/jetify-devbox-plugins/main?dir=zsh-environment"
  ]
}
```

Then enter or update the environment:

```sh
devbox shell
```

Devbox caches GitHub-hosted plugins. To force a refresh while developing a plugin, set a short cache lifetime before invoking Devbox:

```sh
export DEVBOX_X_GITHUB_PLUGIN_CACHE_TTL=0s
devbox shell
```

For a stable project configuration, replace `main` with a published tag once this repository has releases.

## Use a plugin locally

While developing against a local checkout, reference the plugin manifest with a relative path:

```json
{
  "include": [
    "path:./path/to/jetify-devbox-plugins/zsh-environment/plugin.json"
  ]
}
```

## `zsh-environment`

`zsh-environment` provides a ready-to-use interactive shell and installs the following packages:

- **Shell and prompt:** `zsh`, `starship`, `zsh-autosuggestions`, and `zsh-syntax-highlighting`
- **Terminal workflow:** `tmux`, `powerline`, and `powerline-fonts`
- **Everyday utilities:** `bat`, `dust`, `eza`, `less`, `p7zip`, `jq`, and `vim`

When the plugin is activated, Devbox creates and sources these helper scripts in the project's `.devbox` directory:

- `setup-devbox.sh` sets `TERM=xterm-256color`, enables Docker BuildKit, chooses Vim as the default editor, initializes Starship, and configures aliases.
- `zsh-config.sh` configures Zsh history, common key bindings, autosuggestions, and syntax highlighting.

### Provided aliases

| Alias | Behaviour |
| --- | --- |
| `ls`, `la`, `ll`, `lla`, `lt` | `eza`-based directory listings |
| `cat` | `bat -pp` |
| `du` | `dust` |
| `more` | `less` |
| `zip`, `unzip`, `unrar` | `7z` archive commands |
| `tmux` | Attaches to an existing tmux server or starts one |
| `gbd` | Deletes all local Git branches except `main` |

> **Caution:** `gbd` uses forced Git branch deletion. Review your local branches before using it.

## Develop and validate

This repository uses Devbox to provide its contributor tools: `pre-commit`, `yamllint`, and `shellcheck`.

```sh
devbox install
devbox run pre-commit install
devbox run pre-commit run --all-files
```

The pre-commit configuration validates JSON and YAML, checks shell scripts with ShellCheck, enforces EditorConfig rules, detects common Git hazards, and scans for accidentally committed private keys.

## Repository layout

```text
.
├── devbox.json                 # Development tooling for this repository
├── .pre-commit-config.yaml     # Repository validation hooks
└── zsh-environment/
    ├── plugin.json             # Devbox plugin manifest
    ├── README.md               # Plugin-specific notes
    └── scripts/                # Generated Devbox helper scripts
```

## Contributing

1. Create or update a plugin in its own directory with a `plugin.json` manifest.
2. Keep generated helper files under that plugin's `scripts/` directory and reference them through `create_files`.
3. Run the validation command above before committing.
4. Follow the repository's `.editorconfig`: UTF-8, LF line endings, two-space indentation, and no trailing whitespace.
