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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.2/ipsupport-code_v0.69.2_darwin-arm64.tar.gz"
      sha256 "3590b864bf8005d200e94028a9d75cb3dbe897d82795653fdf3be8fb1ea09d83"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.2/ipsupport-code_v0.69.2_darwin-amd64.tar.gz"
      sha256 "de2e381ce53f639dd9846914248869732a9806e503cfb008dd123f655de46b0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.2/ipsupport-code_v0.69.2_linux-arm64.tar.gz"
      sha256 "79faacf542d7ca3ae7d09692a33f76a1c3d91c1dff61bc0e3e3463427a528a93"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.2/ipsupport-code_v0.69.2_linux-amd64.tar.gz"
      sha256 "b69db1a49a9b01f16154b2644065585501880e3e83821bded580ac9fec8879a2"
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
