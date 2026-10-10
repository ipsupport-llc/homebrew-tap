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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.22/ipsupport-code_v0.62.22_darwin-arm64.tar.gz"
      sha256 "cd434ba34b6331655fcd186f1d9d0485d25b4060d3529393cd470203973d99cf"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.22/ipsupport-code_v0.62.22_darwin-amd64.tar.gz"
      sha256 "ae864017daeb05c36368b01d02201e4b99f9708e8b0c15e70161e0ec772b0e12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.22/ipsupport-code_v0.62.22_linux-arm64.tar.gz"
      sha256 "a7e51e62933fd8babd7df92181979fc7c2edfccc7e24c348ac31f4102f34ff06"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.22/ipsupport-code_v0.62.22_linux-amd64.tar.gz"
      sha256 "51d9d1a125c95a91fe5e7dfb51d3d3bac5289000f686afe20580722cc3899dc8"
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
