class IpsupportCode < Formula
  desc "Terminal coding agent for local and cloud models"
  homepage "https://github.com/ipsupport-llc/ipsupport-code"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.0/ipsupport-code_v0.64.0_darwin-arm64.tar.gz"
      sha256 "b529bede4e8df9c56bc12e917b8462eac0824687331d25c252c32e0aaed8471e"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.0/ipsupport-code_v0.64.0_darwin-amd64.tar.gz"
      sha256 "ece41baa14840f5e04e276fbbe04855d9ef1cf50a5f1c6b67f43cf040671c2f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.0/ipsupport-code_v0.64.0_linux-arm64.tar.gz"
      sha256 "78e5859aa094e23280dc7ea429cad8e75680235003149fdc547bd44926ec3b0a"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.0/ipsupport-code_v0.64.0_linux-amd64.tar.gz"
      sha256 "7e3ad875189db34b83288e9bd66a487c682beb161fd4c6ec205ef0f6366a3e7a"
    end
  end

  def install
    bin.install "ipsupport-code"
    bin.install_symlink "ipsupport-code" => "ipco"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ipsupport-code -version")
    assert_match version.to_s, shell_output("#{bin}/ipco -version")
  end
end
