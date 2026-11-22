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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.71.0/ipsupport-code_v0.71.0_darwin-arm64.tar.gz"
      sha256 "8f04540f8e8797994960560903fa20a0e9a0aeea8ac3d3f149c52b374376a483"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.71.0/ipsupport-code_v0.71.0_darwin-amd64.tar.gz"
      sha256 "aab659d57785fef76645e1dd5e1e79aafb6f2ab0d8f399a36186771dc8098202"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.71.0/ipsupport-code_v0.71.0_linux-arm64.tar.gz"
      sha256 "c2e623ec86d9f30c3dac790eb9459b3f6c6ba121abc12029cf8dc2e36b89cea2"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.71.0/ipsupport-code_v0.71.0_linux-amd64.tar.gz"
      sha256 "78c097000ca19f8f11a79586d56a10769ebbd09b2b32cadb9c3d2011e2a7b326"
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
