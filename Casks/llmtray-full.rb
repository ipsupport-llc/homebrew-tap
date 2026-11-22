cask "llmtray-full" do
  version "0.9.3"
  sha256 "2a67ddfc31f12b25653237ca455c06e59010a2be47eff9ff07b34d682a77a1a6"

  url "https://github.com/ipsupport-llc/llmtray/releases/download/v#{version}/LLMTray-Full.dmg"
  name "LLMTray Full"
  desc "Local AI runtime with Python and mlx-lm bundled, no first-run install"
  homepage "https://ipsupport.us/llmtray/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "llmtray"
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "LLMTray.app"

  uninstall quit: "us.ipsupport.llmtray"

  zap trash: [
    "~/Library/Application Support/LLMTray",
    "~/Library/Caches/us.ipsupport.llmtray",
    "~/Library/HTTPStorages/us.ipsupport.llmtray",
    "~/Library/HTTPStorages/us.ipsupport.llmtray.binarycookies",
    "~/Library/Preferences/us.ipsupport.llmtray.plist",
    "~/Library/Saved Application State/us.ipsupport.llmtray.savedState",
  ]
end
