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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.1/ipsupport-code_v0.64.1_darwin-arm64.tar.gz"
      sha256 "3764eff0c2aefae8989c02bd6c78619fb34f56881e456fdcc949404956c80781"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.1/ipsupport-code_v0.64.1_darwin-amd64.tar.gz"
      sha256 "83538f275591dc34aa9c9e920e51521b4a002af845349d4d5c48c8d8ef2d0348"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.1/ipsupport-code_v0.64.1_linux-arm64.tar.gz"
      sha256 "289a4612f1bd0aabdf39b2ef744cb9dc5a397509b75110365206070bf6b2575c"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.1/ipsupport-code_v0.64.1_linux-amd64.tar.gz"
      sha256 "c690a27e8336ebc86689c2649f50b343c415054845516196810af294c7703e45"
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
