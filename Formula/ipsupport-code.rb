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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.0/ipsupport-code_v0.67.0_darwin-arm64.tar.gz"
      sha256 "b333d463236566af8c0158004b10876b2aadd1b6485782e0213ba891888919ee"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.0/ipsupport-code_v0.67.0_darwin-amd64.tar.gz"
      sha256 "9674b2ff242a6538625a8d0b5d8e0e8e56bd7c4d65058190dbe3566c99a8204c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.0/ipsupport-code_v0.67.0_linux-arm64.tar.gz"
      sha256 "6a522fb1fd0f98e4a9064e957cae4b6439c6213c16af45ebcb9d642eb010912a"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.0/ipsupport-code_v0.67.0_linux-amd64.tar.gz"
      sha256 "24b8c23bace45fc4a4c6d900315813b965426be8d966ae6a83ea1c44a0bbd339"
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
