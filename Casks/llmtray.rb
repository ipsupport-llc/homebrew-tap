cask "llmtray" do
  version "0.9.2"
  sha256 "7764127a311c445ae8ea98ee2c86a3ef8230a745e450adfe145822e0a67072aa"

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
