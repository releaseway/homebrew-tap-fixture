# releaseway-version: 1.39540495527.1
# releaseway-source-commit: af0bc26f69900a7355b6c7d4ae9d2fbd0a2c6eba
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39540495527.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "2e0353906c2dd001cfde4fd725c113993c937c65fbdc88418f699a7999361d5b"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39540495527.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "2e0353906c2dd001cfde4fd725c113993c937c65fbdc88418f699a7999361d5b"
    end
    depends_on arch: :x86_64
  end

  version "1.39540495527.1" if version.to_s != "1.39540495527.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
