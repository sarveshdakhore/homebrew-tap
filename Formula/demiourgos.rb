class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.5"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "cdfd708c218edbdf83d7508509ad53bece335283f2771808ea8820ad2ec7eab5"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "f00c70229f86dbdc1efd57a37685a0118678228ca4075153de1f3ce98c53bc0c"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
