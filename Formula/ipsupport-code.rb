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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.2/ipsupport-code_v0.68.2_darwin-arm64.tar.gz"
      sha256 "be0750dff7f52e38afcc8ce88a98422276ae802e16b64eee9a075149d3bc215b"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.2/ipsupport-code_v0.68.2_darwin-amd64.tar.gz"
      sha256 "7f3450737745f0665ec27ca23acb2b04dc4262a30f6e36374fc6bfab2ec05f83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.2/ipsupport-code_v0.68.2_linux-arm64.tar.gz"
      sha256 "a55be4e790fda7a0d546c710b6db5dc3b3e8031c8184264e2c3f82875009006f"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.2/ipsupport-code_v0.68.2_linux-amd64.tar.gz"
      sha256 "ccb827b006dab968f652de573a72fbee09ffc60bc6e8986e0702654ae29b16ab"
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
