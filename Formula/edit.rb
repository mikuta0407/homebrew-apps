class Edit < Formula
  desc "We all edit (mikuta0407 fork of Microsoft Edit)"
  homepage "https://github.com/mikuta0407/edit"
  version "2.1.0-mikuta0407"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.0-mikuta0407/edit-v2.1.0-mikuta0407-macos-arm64.tar.gz"
      sha256 "03bf160a39e6a6a74be301025581066b5b602b9390a920a70c039e9da0f2d414"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.0-mikuta0407/edit-v2.1.0-mikuta0407-linux-arm64.tar.gz"
      sha256 "29d8337ef93d80a3aa3eee60b797e85abfcb847fde7f7717f55d8777a6219bd7"
    end
    on_intel do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.0-mikuta0407/edit-v2.1.0-mikuta0407-linux-amd64.tar.gz"
      sha256 "ee77f0244f5b24d9343e6fd9ccfabbeca14c03c6ff7c960b4c4bcde78dbbb321"
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
