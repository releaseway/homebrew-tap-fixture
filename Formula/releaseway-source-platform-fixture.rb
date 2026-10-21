# releaseway-version: 1.39543238690.1
# releaseway-source-commit: d554d19f2bd2ec1df7a110ff26f1b4446c50bb4e
# releaseway-spec-commit: eaf6bae2ad04ec88aab5dba5565d06cdd3a5567f
# releaseway-spec-path: .github/homebrew/features/source.yml
# releaseway-spec-sha256: 8e6716b1f89ec3d9bd9c2efbf0ea53ae3199f5f763bb6eff8863c682f9984228
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/d554d19f2bd2ec1df7a110ff26f1b4446c50bb4e.tar.gz"
  version "1.39543238690.1"
  sha256 "4a95427bce27285b9090f3ceee72e76cab0bf21def5a8ec40dad918cecd5bd31"
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
