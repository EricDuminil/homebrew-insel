# homebrew-insel

Homebrew tap for [INSEL](https://insel.eu/), a simulation environment for
energy systems (engine, tools, and GUI), developed at HfT Stuttgart.

Only Apple Silicon (arm64) macOS is supported.

## Install

```
brew tap ericduminil/insel
brew trust --cask ericduminil/insel/insel
brew install --cask insel
```

Homebrew requires explicit trust for any non-official tap (since Homebrew
6.0), so the `brew trust` step is required the first time — otherwise
`brew install` refuses to load the cask.

`INSEL.app` is only ad-hoc signed, not notarized by Apple. It installs and
launches without a Gatekeeper prompt when installed via this cask, but if
macOS ever blocks it (e.g. after manually moving/re-downloading the app),
right-click it in Finder and choose "Open", or allow it under
System Settings → Privacy & Security.

## Uninstall

```
brew uninstall --cask insel
```

This runs INSEL's own `uninstall.sh`, which removes the symlinks in
`/usr/local/bin` and `/usr/local/lib`, `/Applications/INSEL.app`, the
package receipt, and `/usr/local/insel`. It leaves `~/Documents/insel.work`
(your INSEL projects/work directory) untouched.

## Updating the cask for a new INSEL release

After publishing the new `.pkg` to insel.eu as usual
(`insel_<version>_arm64_full.pkg`), run:

```
bin/update-cask
```

It reads the current version straight from <https://insel.eu/download/>,
compares it to what's declared in `Casks/insel.rb`, and if they differ,
downloads the new `.pkg`, computes its sha256, updates `Casks/insel.rb`,
and commits the change locally. It prints `Already up to date (<version>)`
and does nothing if there's nothing new. It never pushes — review with
`git show` and push yourself when ready.
