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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.1/ipsupport-code_v0.69.1_darwin-arm64.tar.gz"
      sha256 "3f3d4d135780c596a055c61602826c025cfad57965efd5c89a6d6a41ebf07405"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.1/ipsupport-code_v0.69.1_darwin-amd64.tar.gz"
      sha256 "53beae91b248e3fa60d5a00c555b6e3356667e35efd34fca9a656e3a577ca177"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.1/ipsupport-code_v0.69.1_linux-arm64.tar.gz"
      sha256 "2de3eea2bb6459ca8f936045db152a5a039bbb7a1ebbd18493123da96e821610"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.69.1/ipsupport-code_v0.69.1_linux-amd64.tar.gz"
      sha256 "80e0607f027d67dd865fdfe55db66d321124629416d57e4c08bd0c6f98aa7ebd"
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
