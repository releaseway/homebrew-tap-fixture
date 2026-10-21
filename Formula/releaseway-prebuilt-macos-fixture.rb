# releaseway-version: 1.39547972587.1
# releaseway-source-commit: 53b58636fc064ff6a99a7b324258a43ee53d9584
class ReleasewayPrebuiltMacosFixture < Formula
  desc "Native Apple Silicon binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39547972587.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "a0050caf8d6c29f2d7cde37fee91070b00f191892b92a332dfcf26622ff6cfae"
  license "MIT"

  depends_on :macos
  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39547972587.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "a0050caf8d6c29f2d7cde37fee91070b00f191892b92a332dfcf26622ff6cfae"
    end
    depends_on arch: :arm64
  end

  version "1.39547972587.1" if version.to_s != "1.39547972587.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} darwin/arm64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
