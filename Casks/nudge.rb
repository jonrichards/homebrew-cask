cask "nudge" do
  version "1.1.0.08262021142007"
  sha256 "ec1f345dbc03a93a76dc764cc1a5cd60826472537c66e1de9f1a0e404bb9951d"

  url "https://github.com/macadmins/nudge/releases/download/v.#{version}/Nudge-#{version}.pkg"
  name "Nudge"
  desc "Application for enforcing os updates"
  homepage "https://github.com/macadmins/nudge"

  depends_on macos: ">= :big_sur"

  pkg "Nudge-#{version}.pkg"
  binary "/Applications/Utilities/Nudge.app/Contents/MacOS/Nudge", target: "nudge"

  uninstall pkgutil: "com.github.macadmins.Nudge"

  zap trash: "~/Library/Preferences/com.github.macadmins.Nudge.plist"

  caveats <<~EOS
    Launchctl integration must be installed separately. For the download, see

      https://github.com/macadmins/nudge/releases/latest
  EOS
end
