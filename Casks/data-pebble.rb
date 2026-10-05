cask "data-pebble" do
  version "1.1"
  sha256 "61dc4c6d2dfa3c61e44ea98306b09c709b9bf7f796834d0b325db7b1c0ee5f55"

  url "https://github.com/aidanlowrie/data-pebble/releases/download/v#{version}/DataPebble-#{version}.zip"
  name "Data Pebble"
  desc "Menu bar meter for Wi-Fi data use, with per-app estimates"
  homepage "https://github.com/aidanlowrie/data-pebble"

  depends_on macos: ">= :sonoma"

  app "Data Pebble.app"

  # The app is ad-hoc signed, not notarised; clear quarantine so Gatekeeper allows it to open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Data Pebble.app"]
  end

  uninstall quit: "local.aidan.DataPebble"

  zap trash: "~/Library/Application Support/DataPebble"
end
