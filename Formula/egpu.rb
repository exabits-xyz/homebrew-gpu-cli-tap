class Egpu < Formula
  desc "Exabits GPU Cloud CLI"
  homepage "https://github.com/exabits-xyz/gpu-cli"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_arm64.tar.gz"
      sha256 "9f12f680d06189741640a720d614c89e8ac36c3b83eb88caa34a2c38300d3c06"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_amd64.tar.gz"
      sha256 "b5c24f289ac5a28ef1ee24b150a257538eb850afb87c9a331c04a0ca527e1f36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_arm64.tar.gz"
      sha256 "765c12d5184a92bd10129be752bf7ef6bb5c4a83cedfe8ee8e6d01f68b835b9c"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_amd64.tar.gz"
      sha256 "71a98db9dd849fc6f233ea38b59d05be5d191a489c2c80a922c864ec6453d0cb"
    end
  end

  def install
    bin.install "egpu"
  end

  test do
    system "#{bin}/egpu", "--version"
  end
end
