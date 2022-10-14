cask "browserosaurus-at-15-2-0" do
  arch arm: "arm64", intel: "x64"

  version "15.2.0"
  sha256 arm:   "08f2b91f512f7c45f6725c8605d13c34798794638c8eb5c63e0e2e97afc612be",
         intel: "3c6b529d15ba35fee752cd2137ab5c61d5784cb8e8387d2de3af7e96153c7680"

  url "https://github.com/will-stone/browserosaurus/releases/download/v#{version}/Browserosaurus-darwin-#{arch}-#{version}.zip"
  name "Browserosaurus"
  desc "Open-source browser prompter pinned at the best version with a broken updater"
  homepage "https://github.com/will-stone/browserosaurus"

  auto_updates true

  app "Browserosaurus.app"

  uninstall quit: "com.browserosaurus"

  zap trash: [
    "~/Library/Application Support/Browserosaurus",
    "~/Library/Preferences/com.browserosaurus.plist",
  ]
end
