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
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.1/ipsupport-code_v0.68.1_darwin-arm64.tar.gz"
      sha256 "d2e9beeff76700b2f781c6c6f7abccd45a4f549cf20a6789f964201caf35471c"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.1/ipsupport-code_v0.68.1_darwin-amd64.tar.gz"
      sha256 "fe11363eb7f85e4f09525db49ae80346ecdffd621b5ae8b289ba7fa61c6d8fa0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.1/ipsupport-code_v0.68.1_linux-arm64.tar.gz"
      sha256 "5beb5b17a4915bfd69b488ffd8e4649cd54860a8c0c354456f5065a3d4429c3c"
    end
    on_intel do
      url "https://github.com/ipsupport-llc/ipsupport-code/releases/download/v0.68.1/ipsupport-code_v0.68.1_linux-amd64.tar.gz"
      sha256 "bc1302c08ea3c0a1f04720d2dd8745be8596f4efcb16a87844535cc198570663"
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
