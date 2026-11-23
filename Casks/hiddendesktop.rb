cask "hiddendesktop" do
  version "1.0.0"
  sha256 "614c0d39842d489b45b5cada99b963253d027b44d64864d10b814824f3fd81b2"

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
