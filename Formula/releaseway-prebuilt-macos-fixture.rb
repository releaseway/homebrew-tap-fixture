# releaseway-version: 1.39635184441.1
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewayPrebuiltMacosFixture < Formula
  desc "Native Apple Silicon binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "e01b6b281f09984a2ae24b879910feba487c5a5280a2673c6d2bdbbbe8403ac9"
  license "MIT"

  depends_on :macos
  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "e01b6b281f09984a2ae24b879910feba487c5a5280a2673c6d2bdbbbe8403ac9"
    end
    depends_on arch: :arm64
  end

  version "1.39635184441.1" if version.to_s != "1.39635184441.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} darwin/arm64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
