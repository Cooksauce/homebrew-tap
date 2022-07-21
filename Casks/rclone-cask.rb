cask "rclone-cask" do
  version "1.59.0" # update sha256 hashes with version

  if Hardware::CPU.intel?
    sha256 "e308c72138c1dc9e72e28a47cbf7bfaaed2cf37c3e9e97cc5a597b2cc06ac85d"
    binary "rclone-v#{version}-osx-amd64/rclone"
    manpage "rclone-v#{version}-osx-amd64/rclone.1"
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-amd64.zip",
      verified: "github.com/rclone/rclone/"
  else
    # arm version untested
    sha256 "3b0d7d1a140835725d11b4044a9f83f76b9b02281d2b907b16255d73ccdccaab"
    binary "rclone-v#{version}-osx-arm64/rclone"
    manpage "rclone-v#{version}-osx-arm64/rclone.1"
    url "https://github.com/rclone/rclone/releases/download/v#{version}/rclone-v#{version}-osx-arm64.zip",
      verified: "github.com/rclone/rclone/"
  end

  name "rclone-cask"
  desc "rclone cask to work around lack of mount support in the formula version"
  homepage "https://rclone.org/"
  appcast "https://github.com/rclone/rclone/releases.atom"

  #depends_on cask: "macfuse"
  conflicts_with formula: "rclone"
end
