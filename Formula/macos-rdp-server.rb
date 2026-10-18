class MacosRdpServer < Formula
  desc "RDP server for macOS with JIS keyboard and Mac-to-Mac (MACRDPX) support"
  homepage "https://github.com/mikuta0407/macos-rdp-server"
  url "https://github.com/mikuta0407/macos-rdp-server/releases/download/v0.2.2/macos-rdp-server-v0.2.2-macos-universal.tar.gz"
  sha256 "40d7b1c91796af381866450548dc4aa4bd6414cec572ca90e8574d1cb9b79b09"
  license "MIT"

  depends_on macos: :sonoma

  def install
    libexec.install "macos-rdp-daemon", "install-user.sh"
    bin.install_symlink libexec/"macos-rdp-daemon"
    # The daemon runs from ~/.macos-rdp as a per-user LaunchAgent, signed
    # with a stable certificate so the privacy permissions survive updates.
    (bin/"macos-rdp-install-user").write <<~SH
      #!/bin/bash
      exec "#{opt_libexec}/install-user.sh" "#{opt_libexec}/macos-rdp-daemon" "$@"
    SH
    doc.install "LICENSE", "README.md", "README.ja.md"
  end

  def caveats
    <<~CAVEATS
      Install (and, after every upgrade, reinstall) the per-user agent:
        macos-rdp-install-user
      Settings are passed as environment variables, e.g.
        RDP_KEYBOARD_TYPE=jis macos-rdp-install-user
      Then allow ~/.macos-rdp/bin/macos-rdp-daemon in System Settings >
      Privacy & Security > Screen Recording and Accessibility.

      Restart it:
        launchctl kickstart -k gui/$(id -u)/com.macosrdp.agent

      To remove the agent:
        launchctl bootout gui/$(id -u)/com.macosrdp.agent
        rm ~/Library/LaunchAgents/com.macosrdp.agent.plist
        security delete-keychain ~/.macos-rdp/signing/macos-rdp.keychain-db
        rm -rf ~/.macos-rdp

      More, including running a Mac headless: https://github.com/mikuta0407/macos-rdp-server#readme
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/macos-rdp-daemon --version")
  end
end
