cask "hiddendesktop" do
  version "1.0.1"
  sha256 "7c1008bef6948fb41ce755365d31cf6c1a4ef68c3ac2e99ee478776eedbbcb5a"

  url "https://github.com/mikuta0407/HiddenDesktop/releases/download/v#{version}/HiddenDesktop-v#{version}-macos-universal.zip"
  name "HiddenDesktop"
  desc "Hide desktop icons and widgets from the menu bar"
  homepage "https://github.com/mikuta0407/HiddenDesktop"

  depends_on macos: :ventura

  app "HiddenDesktop.app"

  # 公証していない (ad-hoc 署名) ので、Gatekeeper の quarantine 属性を外す
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/HiddenDesktop.app"],
        writable_paths: ["HiddenDesktop.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  uninstall quit:       "net.mikuta0407.HiddenDesktop",
            login_item: "HiddenDesktop"

  zap trash: "~/Library/Preferences/net.mikuta0407.HiddenDesktop.plist"

  caveats <<~CAVEATS
    If you uninstall while the desktop is hidden, restore it with:
      defaults delete com.apple.finder CreateDesktop; killall Finder
      defaults write com.apple.WindowManager StandardHideWidgets -bool false
  CAVEATS
end
