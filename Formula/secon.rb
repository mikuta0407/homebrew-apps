class Secon < Formula
  desc "SoftEther VPN compatible client with virtual NIC and SOCKS5 modes"
  homepage "https://github.com/mikuta0407/secon"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.1/secon-v0.1.1-macos-arm64.tar.gz"
      sha256 "6d6410746e7ed682cab01ef5258cc4498f9b8ccdf3acaef6ec250a6517328bc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.1/secon-v0.1.1-linux-arm64.tar.gz"
      sha256 "88a590bad526a1e2d4eb99a763b47d37bd4caf1c40c0aa186f29e14c6980e6f3"
    end
    on_intel do
      url "https://github.com/mikuta0407/secon/releases/download/v0.1.1/secon-v0.1.1-linux-amd64.tar.gz"
      sha256 "1c41910f0d89d3e2d4da6b940938df01aecc5553c5bc32a3c294d4f204199720"
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
