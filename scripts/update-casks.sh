#!/usr/bin/env bash
# Points each cask and formula at its product's latest stable GitHub
# release: version from the tag (vX.Y.Z); a cask's sha256 from the asset
# digest GitHub computes, a formula's from the release's checksums.txt (its
# releases carry no digests). Pre-releases are never picked up. Prints what
# changed; fails rather than leave a file half-updated.
#
# One line per cask: <cask file> <owner/repo> <release asset name>.
# One line per formula: <formula file> <owner/repo> <binary name> <os-arch>...
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

FORMULAE="
Formula/ipsupport-code.rb ipsupport-llc/ipsupport-code ipsupport-code darwin-arm64 darwin-amd64 linux-arm64 linux-amd64
"

while read -r file repo name platforms
do
  [[ -n "${file}" ]] || continue
  [[ -n "${platforms}" ]] || fail "${file}: no platforms listed"
  cache="${releases}/${repo//\//_}.json"
  if [[ ! -f "${cache}" ]]
  then
    gh api "repos/${repo}/releases/latest" >"${cache}" || fail "${repo}: cannot read the latest release"
  fi
  tag=$(jq -r '.tag_name' "${cache}")
  [[ "${tag}" =~ ^v[0-9]+(\.[0-9]+)+$ ]] || fail "${repo}: latest release tag '${tag}' is not vX.Y.Z"
  sums=$(gh release download "${tag}" -R "${repo}" -p checksums.txt -O -) || fail "${repo} ${tag}: no checksums.txt"
  # Every platform's sum first, then the edits on a copy: the file is
  # replaced only once all of them took.
  edited="${releases}/$(basename "${file}")"
  cp "${file}" "${edited}"
  for oa in ${platforms}
  do
    asset="${name}_${tag}_${oa}.tar.gz"
    sha=$(awk -v a="${asset}" '$2 == a { print $1 }' <<<"${sums}")
    [[ "${sha}" =~ ^[0-9a-f]{64}$ ]] || fail "${repo} ${tag}: no checksum for ${asset}"
  done
  for oa in ${platforms}
  do
    asset="${name}_${tag}_${oa}.tar.gz"
    sha=$(awk -v a="${asset}" '$2 == a { print $1 }' <<<"${sums}")
    # The url line for this platform and the sha256 line under it, together.
    TAG="${tag}" ASSET="${asset}" SHA="${sha}" OA="${oa}" NAME="${name}" perl -0pi -e '
      $n = s{(url "https://github\.com/[^"]+/releases/download/)v[^/"]+/\Q$ENV{NAME}\E_v[^"]+_\Q$ENV{OA}\E\.tar\.gz"(\s*\n\s*sha256 ")[0-9a-f]{64}"}{$1$ENV{TAG}/$ENV{ASSET}"$2$ENV{SHA}"}g;
      END { exit($n == 1 ? 0 : 1) }
    ' "${edited}" || fail "${file}: no single url + sha256 pair for ${oa}"
  done
  # brew reads the version from the url, per platform: they must all agree.
  others=$(grep -E '^ +url "' "${edited}" | grep -vc "/download/${tag}/${name}_${tag}_" || true)
  [[ "${others}" == 0 ]] || fail "${file}: ${others} url(s) not on ${tag}"
  mv "${edited}" "${file}"
  if ! git diff --quiet -- "${file}"
  then
    echo "$(basename "${file}" .rb) ${tag#v}"
  fi
done <<<"${FORMULAE}"
