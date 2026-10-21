# releaseway-version: 1.39633897128.1
# releaseway-source-commit: 4e4d83db268e7dad0f5d04d5b52f46fdbb56982a
class ReleasewaySourcePlatformFixture < Formula
  desc "Native source fixture for Homebrew platform and revision acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/4e4d83db268e7dad0f5d04d5b52f46fdbb56982a.tar.gz"
  version "1.39633897128.1"
  sha256 "1128922c51bffd5978b8a81abda77f54f5ddba311036d5a5e8da931980ea73bd"
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
