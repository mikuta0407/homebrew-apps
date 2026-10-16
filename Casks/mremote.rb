cask "mremote" do
  version "0.1.0"
  sha256 "387837dcc0a76e95fd385b8baca62c98804d38e2405d88d31e0062faac224c95"

  url "https://github.com/mikuta0407/mRemote/releases/download/v#{version}/mRemote-v#{version}-macos-arm64.zip"
  name "mRemote"
  desc "RDP client with JIS keyboard and Mac-to-Mac (MACRDPX) support"
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

  uninstall quit: "com.mikuta0407.mRemote"

  zap trash: [
    "~/Library/Application Support/mRemote-profiles.json",
    "~/Library/Caches/com.mikuta0407.mRemote",
    "~/Library/HTTPStorages/com.mikuta0407.mRemote",
    "~/Library/Preferences/com.mikuta0407.mRemote.plist",
    "~/Library/Saved Application State/com.mikuta0407.mRemote.savedState",
  ]
end
