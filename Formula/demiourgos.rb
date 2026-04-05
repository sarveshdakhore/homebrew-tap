class Demiourgos < Formula
  desc "Demiourgos CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.2.93"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "3233c5cde64f8d4f1cecff85c5cf29edcfde761124eea64a354d6ac9f9100bbc"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "07095194bddd5c8d4e4ff8e5fd0844dc7c0cdb400eb54b4a27483ecf5e89a2e0"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos version 2>&1")
    assert_match(".", output)
  end
end
