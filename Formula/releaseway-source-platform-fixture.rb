# releaseway-version: 1.39644498091.1
# releaseway-source-commit: e1bbae8ebdaf59a75770ed092e08eda15df97e4f
# releaseway-spec-commit: aebae334b4dd539cbe04880186556030915ee39b
# releaseway-spec-path: .github/homebrew/features/source.yml
# releaseway-spec-sha256: 8e6716b1f89ec3d9bd9c2efbf0ea53ae3199f5f763bb6eff8863c682f9984228
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/e1bbae8ebdaf59a75770ed092e08eda15df97e4f.tar.gz"
  version "1.39644498091.1"
  sha256 "2ee319584719471210f91bb30fbfbc85a7decbdfef8f09a4523489d816c64d2d"
  license "MIT"
  revision 1

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
