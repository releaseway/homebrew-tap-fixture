# releaseway-version: 1.39635184441.2
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/0839029c50f01bf1325e0ace99a2c3e53b7f80d0.tar.gz"
  version "1.39635184441.2"
  sha256 "5543c575234f5e9d24b10d1c33ebd2ba9a1b5634a5d1d3d863b0a6550f9b7d8e"
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
