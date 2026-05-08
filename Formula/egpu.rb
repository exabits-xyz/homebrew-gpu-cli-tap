class Egpu < Formula
  desc "Exabits GPU Cloud CLI"
  homepage "https://github.com/exabits-xyz/gpu-cli"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_arm64.tar.gz"
      sha256 "cba6fbb108e2ba9396703d9f3591808ba962ce753455dee94138c5a6008b486d"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_amd64.tar.gz"
      sha256 "116eb6fa39ef1d63e407da3805f28dca6ad06abb7b99ab9a94d0a09940100f54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_arm64.tar.gz"
      sha256 "bebaa11a8d1f9c08d36c01686dd7a5ee963ae606b92981c3cc4e0c3a7eaefcf0"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_amd64.tar.gz"
      sha256 "db64cb5f4e0ca05cd54c86e0b4dbedc8dd0ce4202776edce0f258c26f5dbab90"
    end
  end

  def install
    bin.install "egpu"
  end

  test do
    system "#{bin}/egpu", "--version"
  end
end
