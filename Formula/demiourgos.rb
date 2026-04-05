class Demiourgos < Formula
  desc "Demiourgos CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.2.96"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "12f9182056f6bcd840d0c9012b1ef4aee9d6e3d8ad16220a0f2dfa1f67f3dcd5"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "5f246a7b407b100929a9b5cc3fe359ddacc2cc80d24951d9c56ce3c5832343b5"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos version 2>&1")
    assert_match(".", output)
  end
end
