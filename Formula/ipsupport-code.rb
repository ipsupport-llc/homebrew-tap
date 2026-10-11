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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.2/ipsupport-code_v0.65.2_darwin-arm64.tar.gz"
      sha256 "63bbd30b8b11aebef689f2eb2f62332c8a336965e084364fee2a1fd850b0157f"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.2/ipsupport-code_v0.65.2_darwin-amd64.tar.gz"
      sha256 "b68bb6714bdfeac50e9e5428e71d6894b1bc1d9a7352ca7d96cb9fe8a0128884"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.2/ipsupport-code_v0.65.2_linux-arm64.tar.gz"
      sha256 "da100b78f818d71d129a58a46a142519b965ad452141b8f832a3b5e0f04455c5"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.2/ipsupport-code_v0.65.2_linux-amd64.tar.gz"
      sha256 "4c3268e6c55156f559eb7452b5f580f0473f988d07712c261cab2f7eaeef007e"
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
