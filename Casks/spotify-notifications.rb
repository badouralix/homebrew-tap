cask "spotify-notifications" do
  version "0.6.0"
  sha256 "6c6c270b6af0ff34f29f7c6b10db0861a1cae99870eea272d57cbf2754378c7b"

  url "https://get.spotify-notifications.app/Spotify%20Notifications%20v#{version}.zip"
  name "Spotify Notifications"
  desc "Bridging spotify and notification center since 2013"
  homepage "https://www.spotify-notifications.app/"

  app "Spotify Notifications v#{version}/Spotify Notifications.app"
end
