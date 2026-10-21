# releaseway-version: 1.39644498091.1
# releaseway-source-commit: e1bbae8ebdaf59a75770ed092e08eda15df97e4f
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39644498091.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "dd9234a438bc429e60a9144108406dc2f4d8ee441f21963f5f0090e63a7e3cec"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39644498091.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "dd9234a438bc429e60a9144108406dc2f4d8ee441f21963f5f0090e63a7e3cec"
    end
    depends_on arch: :x86_64
  end

  version "1.39644498091.1" if version.to_s != "1.39644498091.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
