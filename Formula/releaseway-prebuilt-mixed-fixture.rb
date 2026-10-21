# releaseway-version: 1.39606116893.1
# releaseway-source-commit: bf773b0a6080d28816bf1e83f673fde0b0462101
class ReleasewayPrebuiltMixedFixture < Formula
  desc "Native asymmetric binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39606116893.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "436759bc1f425ffa1413368c5fb3a466c0b2640a8321b6e0903637f61abaa3d1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39606116893.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "436759bc1f425ffa1413368c5fb3a466c0b2640a8321b6e0903637f61abaa3d1"
    end
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39606116893.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "ab436e23b87cc4bde97949f15b749bbbf4ea04f0b2954ac55d5df556f8dc8d5a"
    end
    depends_on arch: :x86_64
  end

  version "1.39606116893.1" if version.to_s != "1.39606116893.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    target = OS.mac? ? "darwin/arm64" : "linux/amd64"
    assert_match "releaseway-native-fixture #{version} #{target}", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
