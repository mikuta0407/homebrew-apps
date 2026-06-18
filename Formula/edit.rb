class Edit < Formula
  desc "We all edit (mikuta0407 fork of Microsoft Edit)"
  homepage "https://github.com/mikuta0407/edit"
  version "2.1.2-mikuta0407"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.2-mikuta0407/edit-v2.1.2-mikuta0407-macos-arm64.tar.gz"
      sha256 "32c3f9774530b365ff9a2969f8fa53f950b912307f56ddbf9710149dd94fa9a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.2-mikuta0407/edit-v2.1.2-mikuta0407-linux-arm64.tar.gz"
      sha256 "c675e5a493a60c94b21a3a750ab6851696fe1b82cfa39ace4421f312590e8cbe"
    end
    on_intel do
      url "https://github.com/mikuta0407/edit/releases/download/v2.1.2-mikuta0407/edit-v2.1.2-mikuta0407-linux-amd64.tar.gz"
      sha256 "53c16ba202df797373cba233f10ec68aac797666f9197d52f67c8e1b97a8a784"
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
