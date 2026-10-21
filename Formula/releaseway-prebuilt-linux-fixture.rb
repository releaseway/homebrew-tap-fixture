# releaseway-version: 1.39543238690.1
# releaseway-source-commit: d554d19f2bd2ec1df7a110ff26f1b4446c50bb4e
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39543238690.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "07f0c1943541f96d01f02938d21f12654de770d7b1b8db5e8491a76aa64240b6"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39543238690.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "07f0c1943541f96d01f02938d21f12654de770d7b1b8db5e8491a76aa64240b6"
    end
    depends_on arch: :x86_64
  end

  version "1.39543238690.1" if version.to_s != "1.39543238690.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
