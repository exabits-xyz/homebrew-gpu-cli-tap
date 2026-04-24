class Egpu < Formula
  desc "Exabits GPU Cloud CLI"
  homepage "https://github.com/exabits-xyz/gpu-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_arm64.tar.gz"
      sha256 "9a49e3c1df2648f948b15f50ac5da83562bbb48b00ba418178fbbc56830ec39c"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_darwin_amd64.tar.gz"
      sha256 "7b373a488b56442dc49299a53ba87f777d5ccb85445d0ef103317284453900fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_arm64.tar.gz"
      sha256 "752de64316cae147579553f6696d5abb017cac3c333392f14b68686ed17f809a"
    end
    on_intel do
      url "https://github.com/exabits-xyz/gpu-cli/releases/download/v#{version}/egpu_linux_amd64.tar.gz"
      sha256 "f637350ca12608a00af89afab670f724501eae1253f11f5e5d7bea46c6977702"
    end
  end

  def install
    bin.install "egpu"
  end

  test do
    system "#{bin}/egpu", "--version"
  end
end
