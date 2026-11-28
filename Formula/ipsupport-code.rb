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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.75.0/ipsupport-code_v0.75.0_darwin-arm64.tar.gz"
      sha256 "896b08a58dac5b9e59d2c0fd6823d43f1bf1286c1db323804002c630d1f8cb3b"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.75.0/ipsupport-code_v0.75.0_darwin-amd64.tar.gz"
      sha256 "e0a15ff8785dd47f9fa25eb5333220655096241181f79ecccb266363717d465c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.75.0/ipsupport-code_v0.75.0_linux-arm64.tar.gz"
      sha256 "7a12d9c2d513756e2f3a5f773b29a16d33353fb30b9c7e2372eebb73a086ec4d"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.75.0/ipsupport-code_v0.75.0_linux-amd64.tar.gz"
      sha256 "d18e813474946448d492cc2dc1c2fbc394fa01989d72b689628a93928f95651f"
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
