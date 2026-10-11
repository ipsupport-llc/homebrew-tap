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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.1/ipsupport-code_v0.65.1_darwin-arm64.tar.gz"
      sha256 "20d98902b76d0a1767b976e5195f67e9066eb891c76c4c0977afc0afbe94be80"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.1/ipsupport-code_v0.65.1_darwin-amd64.tar.gz"
      sha256 "9a57cd851792e87012a1d749d25018a71b135c146d823dd30fdbe513f666b73f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.1/ipsupport-code_v0.65.1_linux-arm64.tar.gz"
      sha256 "e316a3cf3cdc5b4f464feb4db4c61447062d1b51e31602e8a31a21cc7b37f415"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.1/ipsupport-code_v0.65.1_linux-amd64.tar.gz"
      sha256 "55c217a896f3a4fd42561562b9f3aaf8e80d8fa2d9ff722e1364abbe9487d435"
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
