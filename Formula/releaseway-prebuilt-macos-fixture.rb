# releaseway-version: 1.39541318692.1
# releaseway-source-commit: 08097d5476446c455ae3bd62b80016440a4f32fe
class ReleasewayPrebuiltMacosFixture < Formula
  desc "Native Apple Silicon binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39541318692.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "0a46ede626ef2721463fbcacb452af48fd3f9e616f3da4b3387bb4fd51920f3c"
  license "MIT"

  depends_on :macos
  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39541318692.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "0a46ede626ef2721463fbcacb452af48fd3f9e616f3da4b3387bb4fd51920f3c"
    end
    depends_on arch: :arm64
  end

  version "1.39541318692.1" if version.to_s != "1.39541318692.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} darwin/arm64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
