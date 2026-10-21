# releaseway-version: 1.39541318692.1
# releaseway-source-commit: 08097d5476446c455ae3bd62b80016440a4f32fe
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39541318692.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "d2596561ac8cfd44d909f67c00ecabb45edbeb5c0a8d81c3e542e79309046b9e"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39541318692.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "d2596561ac8cfd44d909f67c00ecabb45edbeb5c0a8d81c3e542e79309046b9e"
    end
    depends_on arch: :x86_64
  end

  version "1.39541318692.1" if version.to_s != "1.39541318692.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
