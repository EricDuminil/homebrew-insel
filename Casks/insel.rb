cask "insel" do
  version "8.3.4.0b"
  sha256 "e8d95427ea0f9b96f7e62d740b4f19474a4814727f885b8049380f42aec0859e"

  url "https://insel.eu/download/insel_#{version}_arm64_full.pkg"
  name "INSEL"
  desc "Simulation environment for energy systems (engine, tools, and GUI)"
  homepage "https://insel.eu/"

  depends_on arch: :arm64
  depends_on :macos

  pkg "insel_#{version}_arm64_full.pkg"

  uninstall script: {
    executable: "/usr/local/insel/uninstall.sh",
    sudo:       true,
  }

  caveats <<~EOS
    INSEL is not notarized or signed by Apple. On first launch of INSEL.app
    you may need to right-click INSEL.app in Finder and choose "Open", or
    allow it under System Settings → Privacy & Security.
  EOS
end
