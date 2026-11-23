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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.1/ipsupport-code_v0.72.1_darwin-arm64.tar.gz"
      sha256 "04a650801290f8deae3cd6d07ee968e644d8d095dc71715322f20a8002a649fd"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.1/ipsupport-code_v0.72.1_darwin-amd64.tar.gz"
      sha256 "0f7c7fae1f9299dfc46ae233cb8c610f9bf25c2f9cb3c9228432e3d73faccba0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.1/ipsupport-code_v0.72.1_linux-arm64.tar.gz"
      sha256 "2b5ba11dac554e19ab47ac7477ac2ecda7363d2496c530009da03525542b728a"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.1/ipsupport-code_v0.72.1_linux-amd64.tar.gz"
      sha256 "9a63de1d15354ab574f9204714ca6f99c0eb70bb7a8a6d9f456750e3fa3148c3"
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
