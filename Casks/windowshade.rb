cask "windowshade" do
  version "1.0.19"
  sha256 "f07256729d0c9031a803d37443fd302766a65bffbb5482504b4b5a059a057f1b"

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
