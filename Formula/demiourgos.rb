class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.3"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "d1f2a369515e9e2534b469d5393e95ea30b5cb5e4d2edd150a6b74544fc0d627"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "8e90b0a15c7279c00b33e1681e4d5e590df9cffdfe6e07ca4fc4221084a75550"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
