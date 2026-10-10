#!/usr/bin/env bash
# Points each cask at its product's latest stable GitHub release: version
# from the tag (vX.Y.Z), sha256 from the asset digest GitHub computes
# (nothing is downloaded). Pre-releases are never picked up. Prints what
# changed; fails rather than leave a cask half-updated.
#
# One line per cask: <cask file> <owner/repo> <release asset name>.
set -euo pipefail
cd "$(dirname "$0")/.."

CASKS="
Casks/llmtray.rb      ipsupport-llc/llmtray LLMTray.dmg
Casks/llmtray-full.rb ipsupport-llc/llmtray LLMTray-Full.dmg
"

fail() {
  echo "::error::$*" >&2
  exit 1
}

# One read of each repository's latest release, so casks sharing a release
# can't straddle two versions.
releases=$(mktemp -d)
trap 'rm -rf "${releases}"' EXIT

while read -r file repo asset
do
  [[ -n "${file}" ]] || continue
  cache="${releases}/${repo//\//_}.json"
  if [[ ! -f "${cache}" ]]
  then
    gh api "repos/${repo}/releases/latest" >"${cache}" || fail "${repo}: cannot read the latest release"
  fi
  tag=$(jq -r '.tag_name' "${cache}")
  digest=$(jq -r --arg a "${asset}" '.assets[] | select(.name == $a) | .digest' "${cache}")
  [[ "${tag}" =~ ^v[0-9]+(\.[0-9]+)+$ ]] || fail "${repo}: latest release tag '${tag}' is not vX.Y.Z"
  [[ "${digest}" =~ ^sha256:[0-9a-f]{64}$ ]] || fail "${repo} ${tag}: no sha256 digest for ${asset}"
  version=${tag#v}
  sha=${digest#sha256:}
  grep -Eq '^  version "[^"]*"$' "${file}" || fail "${file}: no version stanza to update"
  grep -Eq '^  sha256 "[0-9a-f]{64}"$' "${file}" || fail "${file}: no sha256 stanza to update"
  sed -i.bak -E \
    -e "s/^  version \"[^\"]*\"$/  version \"${version}\"/" \
    -e "s/^  sha256 \"[0-9a-f]{64}\"$/  sha256 \"${sha}\"/" "${file}"
  rm -f "${file}.bak"
  if ! git diff --quiet -- "${file}"
  then
    echo "$(basename "${file}" .rb) ${version}"
  fi
done <<<"${CASKS}"
