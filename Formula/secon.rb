class Secon < Formula
  desc "SoftEther VPN compatible client with virtual NIC and SOCKS5 modes"
  homepage "https://github.com/mikuta0407/secon"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.2.0/secon-v0.2.0-macos-arm64.tar.gz"
      sha256 "d38706fa867d730a761f45747c2d56783aad63fb3fd33e30461bdd548d5eba93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/secon/releases/download/v0.2.0/secon-v0.2.0-linux-arm64.tar.gz"
      sha256 "af662536efd34da19a58014ee039fa3d05aebc63f21231aa5332587c0bccfe2c"
    end
    on_intel do
      url "https://github.com/mikuta0407/secon/releases/download/v0.2.0/secon-v0.2.0-linux-amd64.tar.gz"
      sha256 "f82b0f827b1ec80e074d5451b40b8131ff8986cdfc856bac61c9d3ff47290e38"
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
