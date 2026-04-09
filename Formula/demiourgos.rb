class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.13"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "6de067e299827046b86f1c522c3f2a30c246243a915360df148711b678c52a11"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "502aefde7d7079673d0720417285a8a6a9485654a35dbd79035fcf3784585af3"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
