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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.66.0/ipsupport-code_v0.66.0_darwin-arm64.tar.gz"
      sha256 "21c7932da11d57f91785a840cd954caa63cabb97049bca6f8b9f9dc92e45d0f4"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.66.0/ipsupport-code_v0.66.0_darwin-amd64.tar.gz"
      sha256 "94ea9ba96c49900684fe52e28d599a98050ccb0377bf77f0f9bbc660e07c80af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.66.0/ipsupport-code_v0.66.0_linux-arm64.tar.gz"
      sha256 "08f584faaf37c8e92e7a9c5d27d7e1f0f6061fdabe29361235835254866d889f"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.66.0/ipsupport-code_v0.66.0_linux-amd64.tar.gz"
      sha256 "50b98b73198bba166d8cbc9eece1bf69e24facf5d834887fe3142a238c97e1ff"
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
