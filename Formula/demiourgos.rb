class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.4"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "29acc8ef4fb6295c644981bda04d9ff62f9ff353f4c22adb1fa040857a2b45e6"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "e10d3225f6f86363d54c549b26f3b6a3ed905def4832788cf60a9223348c735b"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
