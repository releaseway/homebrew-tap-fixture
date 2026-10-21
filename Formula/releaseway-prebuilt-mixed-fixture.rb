# releaseway-version: 1.39635184441.2
# releaseway-source-commit: 0839029c50f01bf1325e0ace99a2c3e53b7f80d0
class ReleasewayPrebuiltMixedFixture < Formula
  desc "Native asymmetric binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.2/releaseway-native-fixture_macos_arm64.tar.gz"
  sha256 "8ff35be6045b6baf98c34e68269e078b50abc230522613d30248f7d4ad9dbd04"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39635184441.2/releaseway-native-fixture_macos_arm64.tar.gz"
      sha256 "8ff35be6045b6baf98c34e68269e078b50abc230522613d30248f7d4ad9dbd04"
    end
    depends_on arch: :arm64
  end

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
    target = OS.mac? ? "darwin/arm64" : "linux/amd64"
    assert_match "releaseway-native-fixture #{version} #{target}", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
