# releaseway-version: 1.39644498091.1
# releaseway-source-commit: e1bbae8ebdaf59a75770ed092e08eda15df97e4f
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/e1bbae8ebdaf59a75770ed092e08eda15df97e4f.tar.gz"
  version "1.39644498091.1"
  sha256 "2ee319584719471210f91bb30fbfbc85a7decbdfef8f09a4523489d816c64d2d"
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
