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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.1/ipsupport-code_v0.70.1_darwin-arm64.tar.gz"
      sha256 "6fcfa13c1cf2ac03ecc106336e937f7ccf8ac9c1a4634af7500573b475e5e4c1"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.1/ipsupport-code_v0.70.1_darwin-amd64.tar.gz"
      sha256 "5e96bf84b2242bfa3d85355e73920cee7ab5a69d90a2c8fe03238ab85c9a07de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.1/ipsupport-code_v0.70.1_linux-arm64.tar.gz"
      sha256 "01589d31c34a285985d6104e82a5330e8e7d2991ba53218cbdb8b47b30190d1c"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.1/ipsupport-code_v0.70.1_linux-amd64.tar.gz"
      sha256 "b8b624c99696ad5893eec713069829308bd29d7edafe63763e76e7b50f5209b8"
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
