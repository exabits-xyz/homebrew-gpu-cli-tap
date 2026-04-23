# homebrew-gpu-cli-tap

Homebrew tap for [egpu](https://github.com/exabits-xyz/gpu-cli) — the Exabits GPU Cloud CLI.

## Install

```sh
brew install exabits-xyz/gpu-cli-tap/egpu
```

## Update formula after a new release

After publishing a new version of `gpu-cli` to GitHub Releases, update the formula with the release version (without the `v` prefix):

```sh
./update-formula.sh <version>
```

Example:

```sh
./update-formula.sh 1.2.3
```

The script:
1. Downloads `checksums.txt` from the GitHub release
2. Extracts SHA256 for all four platform archives (`darwin_arm64`, `darwin_amd64`, `linux_arm64`, `linux_amd64`)
3. Updates `Formula/egpu.rb` with the new version and checksums

Then commit and push:

```sh
git add Formula/egpu.rb
git commit -m "egpu v1.2.3"
git push
```

Users running `brew upgrade egpu` will get the new version automatically.
