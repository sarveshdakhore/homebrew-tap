class Demiourgos < Formula
  desc "Demiourgos client runtime CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.3.2"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "ccc4dcf8cb25da5e6268060064214563402170800205661e51e8ccde26c59e9f"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://raw.githubusercontent.com/sarveshdakhore/demiourgos-client-dist/main/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "df54568c53cbdca418c474cec1b212a0f59276c7ec037c8d25338f90ea2f7430"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos --version 2>&1")
    assert_match(version.to_s, output)
  end
end
