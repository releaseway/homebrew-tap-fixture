# releaseway-version: 1.39633897128.1
# releaseway-source-commit: 4e4d83db268e7dad0f5d04d5b52f46fdbb56982a
class ReleasewayPrebuiltMacosFixture < Formula
  desc "Native Apple Silicon binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39633897128.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "de1fea561c96692a08abf46d2a6119001137fe30c9501aa0ee3626cce7539a2a"
  license "MIT"

  depends_on :macos
  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39633897128.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "de1fea561c96692a08abf46d2a6119001137fe30c9501aa0ee3626cce7539a2a"
    end
    depends_on arch: :arm64
  end

  version "1.39633897128.1" if version.to_s != "1.39633897128.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} darwin/arm64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
