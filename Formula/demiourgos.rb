class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.1"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "90012cd2a0c8a903cbbbec4092b3fe75d72e6d4dec771638c300e8c77ba466e5"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "d07a6af8280139384e804472aebd763eabac7f41a88bd6ae56a20d6052dedfba"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
