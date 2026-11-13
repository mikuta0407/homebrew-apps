cask "mremote" do
  version "0.5.1"
  sha256 "16f7ffe80df50f6c523f3b3b985b37e07f6739fcc242a62dbbdfdb326225ae62"

  url "https://github.com/mikuta0407/mRemote/releases/download/v#{version}/mRemote-v#{version}-macos-arm64.zip"
  name "mRemote"
  desc "RDP and SSH client with JIS keyboard support and the MACRDPX extensions"
  homepage "https://github.com/mikuta0407/mRemote"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "mRemote.app"

  # 公証していない (ad-hoc 署名) ので、Gatekeeper の quarantine 属性を外す
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/mRemote.app"],
        writable_paths: ["mRemote.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  uninstall quit: "net.mikuta0407.mRemote"

  # com.mikuta0407.mRemote: the bundle ID before 0.5.1
  zap trash: [
    "~/Library/Application Support/mRemote-profiles.json",
    "~/Library/Caches/com.mikuta0407.mRemote",
    "~/Library/Caches/net.mikuta0407.mRemote",
    "~/Library/HTTPStorages/com.mikuta0407.mRemote",
    "~/Library/HTTPStorages/net.mikuta0407.mRemote",
    "~/Library/Preferences/com.mikuta0407.mRemote.plist",
    "~/Library/Preferences/net.mikuta0407.mRemote.plist",
    "~/Library/Saved Application State/com.mikuta0407.mRemote.savedState",
    "~/Library/Saved Application State/net.mikuta0407.mRemote.savedState",
  ]
end
