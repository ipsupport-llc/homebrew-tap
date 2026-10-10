cask "llmtray" do
  version "0.8.10"
  sha256 "47f0ea00969cbfebf2bacb0c3670efa198f615111c9ad4a1cc5514135f06aaf9"

  url "https://github.com/ipsupport-llc/llmtray/releases/download/v#{version}/LLMTray.dmg"
  name "LLMTray"
  desc "Local AI runtime: run local models and serve an OpenAI-compatible API"
  homepage "https://ipsupport.us/llmtray/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "llmtray-full"
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
