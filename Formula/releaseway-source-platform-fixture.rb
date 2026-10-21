# releaseway-version: 1.39541318692.1
# releaseway-source-commit: 08097d5476446c455ae3bd62b80016440a4f32fe
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/08097d5476446c455ae3bd62b80016440a4f32fe.tar.gz"
  version "1.39541318692.1"
  sha256 "3d696c49bdecdadf0a68397d540c6a9f3bf92644d7a37e7417beb7a7246358d7"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    cd "native-fixture" do
      system "go", "build", "-buildvcs=false", *std_go_args(output: bin/"releaseway-native-fixture", ldflags: "-s -w -X main.version=#{version}")
    end
  end

  test do
    output = shell_output("#{bin}/releaseway-native-fixture --version")
    assert_match "releaseway-native-fixture #{version}", output
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    assert_match "#{os}/#{arch}", output
  end
end
