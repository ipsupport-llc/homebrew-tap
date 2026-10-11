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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.2/ipsupport-code_v0.64.2_darwin-arm64.tar.gz"
      sha256 "b3578003781fd44984abd39a1a11abf80e2bf32bc432dc00dfa8d86f072e7bff"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.2/ipsupport-code_v0.64.2_darwin-amd64.tar.gz"
      sha256 "3cede7b91f8cae964aa8cb69f7ba916440e6d78b38681a8f47f0f7fb78e6f8e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.2/ipsupport-code_v0.64.2_linux-arm64.tar.gz"
      sha256 "fa682605cf13069bc2ad9fd6fc9f033a743ce095fb5baeb1de42263e30f7cddf"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.64.2/ipsupport-code_v0.64.2_linux-amd64.tar.gz"
      sha256 "c7734c5a0d54359407a5892e16add5d93d74adff95d5fc241370be0982040482"
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
