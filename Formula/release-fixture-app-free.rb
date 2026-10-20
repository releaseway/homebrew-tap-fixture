# releaseway-version: 0.1.3
# releaseway-source-commit: a4411a248181b1415b512348282c09a135549ac8
class ReleaseFixtureAppFree < Formula
  desc "Isolated original-commit release acceptance fixture"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.3/release-fixture_macos_arm64.tar.gz"
      sha256 "2ee32da3a53e3a4818cb9e1e8fabdb0df2f3716766a3f9c4c2c72a7c1f8bff50"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.3/release-fixture_macos_x86_64.tar.gz"
      sha256 "e3ac074c565d4c6e529d39f1343c5e3054f44ead31f07ece645c00878e38d94d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.3/release-fixture_linux_arm64.tar.gz"
      sha256 "ba9f272eb3a180096a92df13346d8b46400535564ee362a26a2e4bca0da0f09d"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.3/release-fixture_linux_x86_64.tar.gz"
      sha256 "7f2d14f63bc8f68b4066235f0c6db55bb3ee7800bae1da5922ecd03a7d81f81b"
    end
  end

  version "0.1.3" if version.to_s != "0.1.3"

  def install
    bin.install "release-fixture" => "release-fixture-app-free"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture-app-free --version")
  end
end
