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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.0/ipsupport-code_v0.70.0_darwin-arm64.tar.gz"
      sha256 "5682a5bfd1860056ad18cf50a8c5270870cce4665efd422fdc27cefd65a2ad85"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.0/ipsupport-code_v0.70.0_darwin-amd64.tar.gz"
      sha256 "cc1abb8369095fbc1a36971a742e65189a2c91d98d4b6495b59dd2ddd66c9a8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.0/ipsupport-code_v0.70.0_linux-arm64.tar.gz"
      sha256 "85f6eb06d87568a4a8d66101af737dc0a865b1cad86fdd9f36eb84dd9015676e"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.70.0/ipsupport-code_v0.70.0_linux-amd64.tar.gz"
      sha256 "ef2c9e37d659171c5487920ea9d4ab3f94a80823c2bf835b2b8bfa534c62298f"
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
