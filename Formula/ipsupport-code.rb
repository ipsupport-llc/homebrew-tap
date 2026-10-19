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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.1/ipsupport-code_v0.67.1_darwin-arm64.tar.gz"
      sha256 "f31290887b6b65791d483b3dc6673453ce0f30f61c63ed4bf705948f9ab081ea"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.1/ipsupport-code_v0.67.1_darwin-amd64.tar.gz"
      sha256 "95195add708e6d58df0db3e766ff6c5f66ef1fae7dfa827048271ca0b27f2662"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.1/ipsupport-code_v0.67.1_linux-arm64.tar.gz"
      sha256 "48fbddb55bdaa089c3a9db783639a32c3031a00e864b734458a6389102105f0d"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.67.1/ipsupport-code_v0.67.1_linux-amd64.tar.gz"
      sha256 "f4a2de8f732a735ef1715d6b19f0790a8602888e145e3d745ef3473e4bdcb088"
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
