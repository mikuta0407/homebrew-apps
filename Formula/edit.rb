class Edit < Formula
  desc "We all edit (mikuta0407 fork of Microsoft Edit)"
  homepage "https://github.com/mikuta0407/edit"
  version "2.2.0-mikuta0407"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.2.0-mikuta0407/edit-v2.2.0-mikuta0407-macos-arm64.tar.gz"
      sha256 "c8393493b79925c8a4d8dcc246dc6affd94ffa744ac8db43c27bd68c2fa8ed97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.2.0-mikuta0407/edit-v2.2.0-mikuta0407-linux-arm64.tar.gz"
      sha256 "4ec02881d985f88aa97f8988dd88f53c3b9d192a04000ada1e27bc2dc17c1bee"
    end
    on_intel do
      url "https://github.com/mikuta0407/edit/releases/download/v2.2.0-mikuta0407/edit-v2.2.0-mikuta0407-linux-amd64.tar.gz"
      sha256 "1a16051cc2e1c062b8297e3483ab356aaf17af4d48fd779cdae2e1466f99b9ba"
    end
  end

  def install
    bin.install "edit"
    doc.install "LICENSE", "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/edit --version")
  end
end
