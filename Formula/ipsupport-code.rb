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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.0/ipsupport-code_v0.69.0_darwin-arm64.tar.gz"
      sha256 "f099c4824180ecc28a9517901fe8125b56123ff7f40493ac76cac7f1ab41994a"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.0/ipsupport-code_v0.69.0_darwin-amd64.tar.gz"
      sha256 "94ae702da2b6481a50e30f29b56bc78e2b03f8c80ab941b491cfb64c92e830f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.0/ipsupport-code_v0.69.0_linux-arm64.tar.gz"
      sha256 "84505f462c6589a26a8ce3faf7d2350311f0cc2361d78873d3551c762adacdc0"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.0/ipsupport-code_v0.69.0_linux-amd64.tar.gz"
      sha256 "177ab6b31f0c13231899c8b15a1e2b2cb2a0f4c6570ca7658399b0a85d269848"
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
