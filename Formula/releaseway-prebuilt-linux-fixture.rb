# releaseway-version: 1.39635184441.2
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.2/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "31f65e489ebeb51a31574542227f8abd2e06e6c31b279654708f6e82a1b0ec68"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.2/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "31f65e489ebeb51a31574542227f8abd2e06e6c31b279654708f6e82a1b0ec68"
    end
    depends_on arch: :x86_64
  end

  version "1.39635184441.2" if version.to_s != "1.39635184441.2"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
