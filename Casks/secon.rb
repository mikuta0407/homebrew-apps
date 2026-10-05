cask "secon" do
  version "0.1.1"
  sha256 "6d6410746e7ed682cab01ef5258cc4498f9b8ccdf3acaef6ec250a6517328bc8"

  url "https://github.com/mikuta0407/secon/releases/download/v#{version}/secon-v#{version}-macos-arm64.tar.gz"
  name "secon"
  desc "SoftEther VPN compatible client with virtual NIC and SOCKS5 modes"
  homepage "https://github.com/mikuta0407/secon"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "secon.app"
  binary "#{appdir}/secon.app/Contents/MacOS/secon"

  # 公証していない (ad-hoc 署名) ので、Gatekeeper の quarantine 属性を外す
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/secon.app"]
  end

  uninstall quit: "io.github.mikuta0407.secon"

  zap trash: [
    "~/Library/LaunchAgents/io.github.mikuta0407.secon-gui.plist",
    "~/Library/Preferences/fyne/io.github.mikuta0407.secon",
    "~/Library/Caches/secon",
  ]

  caveats <<~CAVEATS
    Register the daemon (the virtual NIC mode needs root):
      sudo secon service install
    Then open secon from Launchpad and add a profile.
  CAVEATS
end
