class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.9"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "d60bcdb3146b1856d7502a05caf223d2b95550438d1c002a06ecd505796aeccf"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "be72cb997f5d934b46236d6cf0045c7c9d211bec295c0b7569b65e4dde18e11f"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
