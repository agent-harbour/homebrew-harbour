class Harbour < Formula
  desc "Run agents across your repos in an isolated Colima VM"
  homepage "https://github.com/agent-harbour/harbour"
  version "0.1.0"

  depends_on "colima"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agent-harbour/harbour/releases/download/v0.1.0/harbour-v0.1.0-darwin-arm64.tar.gz"
      sha256 "4d412f6c029d9fda7222f426daf3d5ae8ecc9b5c2a86ecdf5b9e19a20e3240dd"
    else
      url "https://github.com/agent-harbour/harbour/releases/download/v0.1.0/harbour-v0.1.0-darwin-amd64.tar.gz"
      sha256 "6c5333702f83da7697383389b95ae1cfc21797024536bb194a5f47554a0413e7"
    end
  end

  def install
    bin.install "harbour"
  end

  test do
    assert_equal "harbour v#{version}\n", shell_output("#{bin}/harbour version")
  end
end
