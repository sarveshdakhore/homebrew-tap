class Demiourgos < Formula
  desc "Demiourgos CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.2.81"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "8fdd81e5c9989d1ce0568108c816b4b9f5c8da4ddb2c5b4ee73fa32f80239404"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "a7edd28da6a711a6f766551b6c239d7be1f5b2c050921e5316e1e508ac64ced2"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos version 2>&1")
    assert_match(".", output)
  end
end
