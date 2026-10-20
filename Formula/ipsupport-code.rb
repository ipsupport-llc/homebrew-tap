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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.0/ipsupport-code_v0.68.0_darwin-arm64.tar.gz"
      sha256 "be845644b550000d5f51046af266cd1c020670717644053509150acf3840ead1"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.0/ipsupport-code_v0.68.0_darwin-amd64.tar.gz"
      sha256 "eb84d581fe4da7ca526d2836bf86959ed9b98c9bdf06185897ef2ea0bdb34781"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.0/ipsupport-code_v0.68.0_linux-arm64.tar.gz"
      sha256 "78cea5e9c2e3210395f9b181d0bd5bfd3556805d15f1646e5f25ef23b9e4b758"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.0/ipsupport-code_v0.68.0_linux-amd64.tar.gz"
      sha256 "79a3e660c65598f63eede767db08928a64a62531ce9b409d4b95acad995e6bbf"
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
