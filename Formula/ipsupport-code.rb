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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.23/ipsupport-code_v0.62.23_darwin-arm64.tar.gz"
      sha256 "7ed0e9533313932048bdaceab2490b05576404dcf962abc46dd117a4c246c037"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.23/ipsupport-code_v0.62.23_darwin-amd64.tar.gz"
      sha256 "075b7d6ca4a56a51837545b3b82b04d4cdf58b7a3aeda37bcb1ce6895710a249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.23/ipsupport-code_v0.62.23_linux-arm64.tar.gz"
      sha256 "fd1d3fc1a713e4849a366190bc5233e24bb32005e922032a01d19c3956790cc9"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.62.23/ipsupport-code_v0.62.23_linux-amd64.tar.gz"
      sha256 "ec4d5362e41a7faa7f29c73ee657548f0796bb71e602a2707849070bd3da6df9"
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
