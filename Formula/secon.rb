class Secon < Formula
  desc "SoftEther VPN compatible client with virtual NIC and SOCKS5 modes"
  homepage "https://github.com/mikuta0407/secon"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.0/secon-v0.1.0-macos-arm64.tar.gz"
      sha256 "d14562d627a2abd48852ca5bdded740a6a090a9d35bb0139670d180b395cd53f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.0/secon-v0.1.0-linux-arm64.tar.gz"
      sha256 "df5902fd3ba2d84e67add7c936e23da078b8e9354ca99b450cd9c9235773990a"
    end
    on_intel do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.0/secon-v0.1.0-linux-amd64.tar.gz"
      sha256 "4b7c9d5df6249fed97e5ecc8d3dd07aeb1760c7c6eaafa0ebc2e22bca21b4df8"
    end
  end

  def install
    bin.install "secon"
    bin.install "secon-gui" if OS.mac?
    doc.install "LICENSE", "NOTICE", "README.md", "README.ja.md"
  end

  def caveats
    <<~CAVEATS
      Register the daemon (the virtual NIC mode needs root):
        sudo #{opt_bin}/secon service install
      Then add a profile with secon-gui (macOS) or /etc/secon/config.toml, and run:
        secon reload
      SOCKS mode only, without root:
        #{opt_bin}/secon service install --user
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/secon version")
  end
end
