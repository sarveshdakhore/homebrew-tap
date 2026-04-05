class Demiourgos < Formula
  desc "Demiourgos CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.2.95"

  if OS.mac?
    # Some non-interactive environments report Hardware::CPU as unknown.
    # Fall back to RUBY_PLATFORM so arm64 macOS installs still work.
    if Hardware::CPU.arm? || RUBY_PLATFORM.include?("arm64")
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "cc3af303a1d25d4fd6fb53a126cce39dea7fc14b4142564ca12d51efa47b8e01"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "ffd75e97c82daae5bdf5d0182c6ba30ac537b5197a26f910b87f03057f2ed095"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos version 2>&1")
    assert_match(".", output)
  end
end
