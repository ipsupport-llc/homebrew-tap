# IPSupport Homebrew tap

```sh
brew install --cask ipsupport-llc/tap/llmtray
```

| Cask | |
|---|---|
| `llmtray` | [LLMTray](https://github.com/ipsupport-llc/llmtray): local AI runtime for macOS (Apple Silicon). The app installs mlx-lm on first launch. |
| `llmtray-full` | The same app with Python and mlx-lm bundled, for Macs that should skip the first-run install. |

LLMTray updates itself (Sparkle) whichever way it was installed.
`brew uninstall --zap --cask llmtray` also removes its
settings, chats and runtime; your models folder is never touched.

## Maintenance

Casks follow their product's latest stable release on their own:
[Update casks](.github/workflows/update.yml) runs every three hours (or by
hand) and commits the new version and checksum. Pre-releases are skipped.
A new cask is a file here plus a line in
[scripts/update-casks.sh](scripts/update-casks.sh); a formula will need
its own update step.
