cask "insel" do
  version "8.3.4.0b"
  sha256 "6b99f9db3c8b2f09fff4288108e48787b3b3f5b7c4a846d39da98f3c088eee97"

  url "https://insel.eu/download/insel_#{version}_arm64_full.pkg"
  name "INSEL"
  desc "Simulation environment for energy systems (engine, tools, and GUI)"
  homepage "https://insel.eu/"

  depends_on arch: :arm64
  depends_on :macos
  depends_on formula: "gnuplot"

  pkg "insel_#{version}_arm64_full.pkg"

  uninstall script: {
    executable: "/usr/local/insel/uninstall.sh",
    sudo:       true,
  }

  caveats <<~EOS
    INSEL.app is only ad-hoc signed, not notarized by Apple. It installs and
    launches without a Gatekeeper prompt when installed via this cask, but if
    macOS ever blocks it (e.g. after manually moving/re-downloading the app),
    right-click it in Finder and choose "Open", or allow it under
    System Settings → Privacy & Security.
  EOS
end
