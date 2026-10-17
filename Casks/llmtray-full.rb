cask "llmtray-full" do
  version "0.9.0"
  sha256 "399595eff9ad0ed4bc87f4d4e32094bae56bfa1388c0e6d76893eb7f6853bf19"

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
