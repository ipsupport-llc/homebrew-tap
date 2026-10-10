class IpsupportCode < Formula
  desc "Terminal coding agent for local and cloud models"
  homepage "https://github.com/ipsupport-llc/ipsupport-code"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.21/ipsupport-code_v0.62.21_darwin-arm64.tar.gz"
      sha256 "6e13fcfbce7930f835736d2e99022f00f7f184abc2f87a7cb5dfeb10f55d3911"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.21/ipsupport-code_v0.62.21_darwin-amd64.tar.gz"
      sha256 "f1b552afae4f732788ce55ec5ce176e2a7bd638ef52a4a7832783d1784f55323"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.21/ipsupport-code_v0.62.21_linux-arm64.tar.gz"
      sha256 "6b10c52f5232fc581bc2edc436d8092862e8fee877357837c94759bc0edce694"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.21/ipsupport-code_v0.62.21_linux-amd64.tar.gz"
      sha256 "a7a3e3d5542867a279216f805b659e0dbfc5ae67662b2ea372c4ca199e99b710"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
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
