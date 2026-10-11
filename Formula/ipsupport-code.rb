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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.0/ipsupport-code_v0.65.0_darwin-arm64.tar.gz"
      sha256 "6304d274d27ee035e646793bc58273e49541088b31180e6b6c93199131952e7e"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.0/ipsupport-code_v0.65.0_darwin-amd64.tar.gz"
      sha256 "67e534ea6ec341fc79e6de9287b1bc32341e4a0f858316a515eea7da21fa8cb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.0/ipsupport-code_v0.65.0_linux-arm64.tar.gz"
      sha256 "0f29fda3d610b922c4a2a731dac81c97055872f68f18c0e0269c085eb12ab3bb"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.65.0/ipsupport-code_v0.65.0_linux-amd64.tar.gz"
      sha256 "1e0b582532aa3a83970630949d0ec4a382a8f136b9812b97b1724b53bcf42fa8"
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
