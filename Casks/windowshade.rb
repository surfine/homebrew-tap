cask "windowshade" do
  version "1.0.20"
  sha256 "414bae0161ea4d63f5223bae4f16d802c4bae2acf32f2e46dcc3223475fbf737"

  url "https://github.com/surfine/WindowShade/releases/download/v#{version}/WindowShade-v#{version}.zip"
  name "WindowShade"
  desc "Roll a window up into its title bar and keep its place"
  homepage "https://windowshade.aaronlau.me/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "WindowShade.app"

  uninstall quit: "com.windowshade.prototype"

  # Application Support/WindowShade is left alone on purpose: it holds the
  # file shelf, which can contain the user's own files.
  zap trash: [
    "~/Library/Caches/com.windowshade.prototype",
    "~/Library/HTTPStorages/com.windowshade.prototype",
    "~/Library/Logs/WindowShade",
    "~/Library/Preferences/com.windowshade.prototype.plist",
    "~/Library/Saved Application State/com.windowshade.prototype.savedState",
  ]
end
