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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.63.0/ipsupport-code_v0.63.0_darwin-arm64.tar.gz"
      sha256 "7dea76f26b8133e0325d4abf333e524601e0a5feb969151760b2f1590a3edbb4"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.63.0/ipsupport-code_v0.63.0_darwin-amd64.tar.gz"
      sha256 "98540b14cb626fae0d1440f83f83f9e4eaeecacffc3113b420bd4b14d0bc7658"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.63.0/ipsupport-code_v0.63.0_linux-arm64.tar.gz"
      sha256 "875185af36051433d295789b5ede2ce3968948a770079811698ab2bf8cffc1dd"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.63.0/ipsupport-code_v0.63.0_linux-amd64.tar.gz"
      sha256 "666d9093b945499714b91e9acbed171a8808c7ccd7035c71366032e5f4b9a4c4"
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
