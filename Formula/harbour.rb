class Harbour < Formula
  desc "Run agents across your repos in an isolated Colima VM"
  homepage "https://github.com/agent-harbour/harbour"
  version "0.2.0"

  depends_on "colima"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agent-harbour/harbour/releases/download/v0.2.0/harbour-v0.2.0-darwin-arm64.tar.gz"
      sha256 "1a680d79d2b36009a046d13befabaeeec8a3109ed6a445742feea78a56202863"
    else
      url "https://github.com/agent-harbour/harbour/releases/download/v0.2.0/harbour-v0.2.0-darwin-amd64.tar.gz"
      sha256 "316b5d2b0eb76a9bb6a38370b2e13679ff05d662400e93bb267bc4d601cf247d"
    end
  end

  def install
    bin.install "harbour"
  end

  test do
    assert_equal "harbour v#{version}\n", shell_output("#{bin}/harbour version")
  end
end
