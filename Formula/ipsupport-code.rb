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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.74.0/ipsupport-code_v0.74.0_darwin-arm64.tar.gz"
      sha256 "8c1b0e745157fa35eda9842a83c8e5cec289781b9c8ecfa0806a088b235f9821"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.74.0/ipsupport-code_v0.74.0_darwin-amd64.tar.gz"
      sha256 "8888694e35b2850628fb0db9beebe23d7a0762438f01601e292f0218cd8aa01d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.74.0/ipsupport-code_v0.74.0_linux-arm64.tar.gz"
      sha256 "cd71206f121315c3f5a7665035c22b496acccdbc302e2a1527412ea3d42e4ff2"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.74.0/ipsupport-code_v0.74.0_linux-amd64.tar.gz"
      sha256 "ef3f00fa51564b1921a2d9a15787497ff8f3a2be2f4caac4c2846cdb3ff91766"
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
