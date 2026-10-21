# releaseway-version: 1.39635184441.1
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewayPrebuiltMixedFixture < Formula
  desc "Native asymmetric binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "e01b6b281f09984a2ae24b879910feba487c5a5280a2673c6d2bdbbbe8403ac9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "e01b6b281f09984a2ae24b879910feba487c5a5280a2673c6d2bdbbbe8403ac9"
    end
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "6352a46bf5ac20148135ad882e2139e2659b20e928ccd494a28198d9aba2cdc1"
    end
    depends_on arch: :x86_64
  end

  version "1.39635184441.1" if version.to_s != "1.39635184441.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    target = OS.mac? ? "darwin/arm64" : "linux/amd64"
    assert_match "releaseway-native-fixture #{version} #{target}", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
