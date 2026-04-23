class Egpu < Formula
  desc "Exabits GPU Cloud CLI"
  homepage "https://github.com/exabits-xyz/gpu-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
    end
  end

  def install
    bin.install "egpu"
  end

  test do
    system "#{bin}/egpu", "--version"
  end
end
