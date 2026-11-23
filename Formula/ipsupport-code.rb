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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.0/ipsupport-code_v0.72.0_darwin-arm64.tar.gz"
      sha256 "fe65c37c785057a3c56b48beb9cdbef3184bc341176fd3c16a3583c89f0cdb2a"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.0/ipsupport-code_v0.72.0_darwin-amd64.tar.gz"
      sha256 "78fe1288713e9e009cf4d7da051bae3f947a676d77868d8186b30d7ec9245388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.0/ipsupport-code_v0.72.0_linux-arm64.tar.gz"
      sha256 "65e8a9bdb87957034f3f1f990ae7316f14f152743ec418cbbb29395750e19353"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.72.0/ipsupport-code_v0.72.0_linux-amd64.tar.gz"
      sha256 "26b4d769ffa645733ec73ea76e6c7ec75d8d08604f32dd499215447e12fe4222"
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
