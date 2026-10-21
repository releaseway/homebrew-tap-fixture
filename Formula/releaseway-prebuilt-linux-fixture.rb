# releaseway-version: 1.39635184441.1
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "6352a46bf5ac20148135ad882e2139e2659b20e928ccd494a28198d9aba2cdc1"
  license "MIT"

  depends_on :linux
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
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
