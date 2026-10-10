cask "llmtray-full" do
  version "0.8.10"
  sha256 "3130e1ab9a61aa0e4ee51c6554d56dc9cd7a8005a968376d211fdbfae735a926"

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
