cask "pcloud-drive" do
  module Utils
    def self.code
      if Hardware::CPU.arm?
        "XZVkmjVZWwo9poN94RYScpUXoWDHeyBareSV"
      elsif Hardware::CPU.intel?
        "XZo7mjVZMDpFbSo6SYuTzNiNH49xs7zpuwFX"
      end
    end

    def self.suffix
      if Hardware::CPU.arm?
        " macFUSE"
      elsif Hardware::CPU.intel?
        ""
      end
    end
  end

  version "3.11.9"
  sha256 arm:   "e2a19752339a33017d0973807c5e1df0d257bed012fabd14828ef8218d15a5ef",
         intel: "58742bd2752b098c5489e74d543cdf25ca862f100f0819329382469fc9532850"

  url "https://api.pcloud.com/getpublinkdownload?code=#{Utils.code}" do |page|
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

  pkg "pCloud Drive #{version}#{Utils.suffix}.pkg"

  uninstall quit:    "com.pcloud.pcloud.macos",
            pkgutil: "com.mobileinno.pkg.pCloudDrive"
end
