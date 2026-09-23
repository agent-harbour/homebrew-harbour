class Harbour < Formula
  desc "Run agents across your repos in an isolated Colima VM"
  homepage "https://github.com/agent-harbour/harbour"
  version "0.2.1"

  depends_on "colima"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/agent-harbour/harbour/releases/download/v0.2.1/harbour-v0.2.1-darwin-arm64.tar.gz"
      sha256 "da359188a4065e77b8cee5c6c26823dba4d81051bf835abd8028eccc9e60fd2e"
    else
      url "https://github.com/agent-harbour/harbour/releases/download/v0.2.1/harbour-v0.2.1-darwin-amd64.tar.gz"
      sha256 "84c64b22216ee0f54886e20f4362a037ba0155ac9974993157f43ffd5f42d85c"
    end
  end

  def install
    bin.install "harbour"
  end

  test do
    assert_equal "harbour v#{version}\n", shell_output("#{bin}/harbour version")
  end
end
