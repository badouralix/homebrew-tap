cask "pcloud-drive" do
  arch arm: " macFUSE", intel: ""

  on_arm do
    version "3.13.0,XZg58xVZz3rkWEnsB97CgzvxdexoWFucrSp7"
    sha256 "0d01f1256565cf1e7d334158c042d417979540ebfaddf982cff8aea3678d84d8"
  end
  on_intel do
    version "3.13.0,XZ258xVZIn2QLCKCQQkG0UCTqXv0YFl53Jgy"
    sha256 "96a31e53ce03285745f25786f805063df17172893da4a53f63f87acd5f5bed29"
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
