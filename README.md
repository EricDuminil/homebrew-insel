# homebrew-insel

Homebrew tap for [INSEL](https://insel.eu/), a simulation environment for
energy systems (engine, tools, and GUI), developed HfT Stuttgart.

Only Apple Silicon (arm64) macOS is supported.

## Install

```
brew tap ericduminil/insel
brew install --cask insel
```

INSEL is not notarized or signed by Apple. On first launch of `INSEL.app`
you may need to right-click it in Finder and choose "Open", or allow it
under System Settings → Privacy & Security.

## Uninstall

```
brew uninstall --cask insel
```

This runs INSEL's own `uninstall.sh`, which removes the symlinks in
`/usr/local/bin` and `/usr/local/lib`, `/Applications/INSEL.app`, the
package receipt, and `/usr/local/insel`. It leaves `~/Documents/insel.work`
(your INSEL projects/work directory) untouched.

## Updating the cask for a new INSEL release

1. Publish the new `.pkg` to insel.eu as usual (`insel_<version>_arm64_full.pkg`).
2. Compute its checksum:
   ```
   curl -sL https://insel.eu/download/insel_<version>_arm64_full.pkg | shasum -a 256
   ```
3. In `Casks/insel.rb`, bump `version` and update `sha256` to the new value.
4. Sanity-check before pushing:
   ```
   brew audit --cask insel
   brew style --cask Casks/insel.rb
   ```
5. Commit and push.
