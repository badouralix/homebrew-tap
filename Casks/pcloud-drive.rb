cask "pcloud-drive" do
  arch arm: " macFUSE", intel: ""

  on_arm do
    version "3.11.9,XZVkmjVZWwo9poN94RYScpUXoWDHeyBareSV"
    sha256 "e2a19752339a33017d0973807c5e1df0d257bed012fabd14828ef8218d15a5ef"
  end
  on_intel do
    version "3.11.9,XZo7mjVZMDpFbSo6SYuTzNiNH49xs7zpuwFX"
    sha256 "58742bd2752b098c5489e74d543cdf25ca862f100f0819329382469fc9532850"
  end

  url "https://api.pcloud.com/getpublinkdownload?code=#{version.csv.second}" do |page|
    require "json"
    data = JSON.parse(page)
    "https://" + data["hosts"][0] + data["path"]
  end
  name "pCloud Drive"
  desc "Client of the most secure encrypted cloud storage"
  homepage "https://www.pcloud.com/"

  livecheck do
    url "https://www.pcloud.com/release-notes/mac-os.html"
    strategy :page_match
    regex(%r{<b>\d\.\d\.\d</b>}i)
  end

  auto_updates true

  pkg "pCloud Drive #{version.csv.first}#{arch}.pkg"

  uninstall quit:    "com.pcloud.pcloud.macos",
            pkgutil: "com.mobileinno.pkg.pCloudDrive"
end
