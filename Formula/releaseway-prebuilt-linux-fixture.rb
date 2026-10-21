# releaseway-version: 1.39547972587.1
# releaseway-source-commit: 53b58636fc064ff6a99a7b324258a43ee53d9584
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39547972587.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "bd178f943bbf9b3cde0f56efc0cfb27f71e366b8ba6fea076b97381969b1cabd"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39547972587.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "bd178f943bbf9b3cde0f56efc0cfb27f71e366b8ba6fea076b97381969b1cabd"
    end
    depends_on arch: :x86_64
  end

  version "1.39547972587.1" if version.to_s != "1.39547972587.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
