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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.73.0/ipsupport-code_v0.73.0_darwin-arm64.tar.gz"
      sha256 "aab042203ffd11563ecbb81338260fc6928a6bf29678de141e206bf5983c691c"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.73.0/ipsupport-code_v0.73.0_darwin-amd64.tar.gz"
      sha256 "44a98286a746c8ea68c31932240de323e796bd55840ddae1e043004d7ca7aea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.73.0/ipsupport-code_v0.73.0_linux-arm64.tar.gz"
      sha256 "0b2fedb9f9ea1cf1b12458072e9c8d344e01af289691c611c093ec7d7adca14e"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.73.0/ipsupport-code_v0.73.0_linux-amd64.tar.gz"
      sha256 "53efba253b37b3bdccf78ebd26678acadee6747fff70ad92fcbf476cb9251807"
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
