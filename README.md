# IPSupport Homebrew tap

```sh
brew install --cask ipsupport-llc/tap/llmtray
brew install ipsupport-llc/tap/ipco
```

| Cask | |
|---|---|
| `llmtray` | [LLMTray](https://github.com/ipsupport-llc/llmtray): local AI runtime for macOS (Apple Silicon). The app installs mlx-lm on first launch. |
| `llmtray-full` | The same app with Python and mlx-lm bundled, for Macs that should skip the first-run install. |

| Formula | |
|---|---|
| `ipsupport-code` (alias `ipco`) | [ipsupport-code](https://github.com/ipsupport-llc/ipsupport-code): terminal coding agent for local and cloud models, macOS and Linux. Installs `ipsupport-code` and the short name `ipco`. |

LLMTray updates itself (Sparkle) whichever way it was installed.
ipsupport-code installed from here is updated by `brew upgrade ipsupport-code`
(its own `update` says so).
`brew uninstall --zap --cask llmtray` also removes its
settings, chats and runtime; your models folder is never touched.

## Maintenance

Casks and formulae follow their product's latest stable release on their
own: [Update casks](.github/workflows/update.yml) runs every three hours (or
by hand) and commits the new version and checksums — a cask's from GitHub's
asset digest, a formula's from the release's `checksums.txt`. Pre-releases
are skipped. A new cask or formula is a file here plus a line in
[scripts/update-casks.sh](scripts/update-casks.sh).
