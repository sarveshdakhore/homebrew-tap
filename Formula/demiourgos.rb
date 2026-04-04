class Demiourgos < Formula
  desc "Demiourgos CLI"
  homepage "https://github.com/sarveshdakhore/demiourgos-client-dist"
  version "0.2.6"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-darwin-arm64.tar.gz"
      sha256 "f585898bcd58fa9a4c809b5257267d4f4333e5bb5d2b15dc7d72e356909fde91"
    else
      odie "Intel macOS builds are not published yet. Use Apple Silicon macOS or Linux."
    end
  elsif OS.linux?
    url "https://github.com/sarveshdakhore/demiourgos-client-dist/releases/download/v#{version}/demiourgos-#{version}-linux-amd64.tar.gz"
    sha256 "fa748d5b440db88106160802940b1341190d1bc4bc7c7761749aba8256d32cd3"
  end

  def install
    bin.install "demiourgos"
  end

  test do
    output = shell_output("#{bin}/demiourgos version 2>&1")
    assert_match(".", output)
  end
end
