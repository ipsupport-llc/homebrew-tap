#!/usr/bin/env bash
# Points each cask at its product's latest stable GitHub release: version
# from the tag, sha256 from the asset digest GitHub computes (nothing is
# downloaded). Pre-releases are never picked up. Prints what changed.
#
# One line per cask: <cask file> <owner/repo> <release asset name>.
set -euo pipefail
cd "$(dirname "$0")/.."

CASKS="
Casks/llmtray.rb      ipsupport-llc/llmtray LLMTray.dmg
Casks/llmtray-full.rb ipsupport-llc/llmtray LLMTray-Full.dmg
"

while read -r file repo asset
do
  [[ -n "${file}" ]] || continue
  release=$(gh api "repos/${repo}/releases/latest")
  version=$(jq -r '.tag_name | ltrimstr("v")' <<<"${release}")
  digest=$(jq -r --arg a "${asset}" '.assets[] | select(.name == $a) | .digest' <<<"${release}")
  if ! [[ "${version}" =~ ^[0-9]+(\.[0-9]+)+$ ]] || ! [[ "${digest}" =~ ^sha256:[0-9a-f]{64}$ ]]
  then
    echo "::error::${repo}: latest release has version '${version}', ${asset} digest '${digest}'" >&2
    exit 1
  fi
  sha=${digest#sha256:}
  sed -i.bak -E \
    -e "s/^  version \"[^\"]*\"/  version \"${version}\"/" \
    -e "s/^  sha256 \"[0-9a-f]*\"/  sha256 \"${sha}\"/" "${file}"
  rm -f "${file}.bak"
  if ! git diff --quiet -- "${file}"
  then
    echo "$(basename "${file}" .rb) ${version}"
  fi
done <<<"${CASKS}"
