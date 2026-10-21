# releaseway-version: 1.39644498091.1
# releaseway-source-commit: e1bbae8ebdaf59a75770ed092e08eda15df97e4f
class ReleasewayPrebuiltMacosFixture < Formula
  desc "Native Apple Silicon binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39644498091.1/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "33db918b0ebf7907c2e3b45e9e83b06d487063eb1eb751ef234f9eb140685d5c"
  license "MIT"

  depends_on :macos
  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39644498091.1/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "33db918b0ebf7907c2e3b45e9e83b06d487063eb1eb751ef234f9eb140685d5c"
    end
    depends_on arch: :arm64
  end

  version "1.39644498091.1" if version.to_s != "1.39644498091.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} darwin/arm64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
