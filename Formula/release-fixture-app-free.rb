# releaseway-version: 0.1.4
# releaseway-source-commit: e6da9889eb654e911f37c121f7bd812ef0ae48b8
class ReleaseFixtureAppFree < Formula
  desc "Isolated original-commit release acceptance fixture"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.4/release-fixture_macos_arm64.tar.gz"
      sha256 "50f91beb1a0d86e4dbea6b6ab184dcfc89ce70642ca8a758f50440f008913d62"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.4/release-fixture_macos_x86_64.tar.gz"
      sha256 "ab209763dcf5fbac947670eadbd74c38c3a97676d6580ad6847ff16892846ce9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.4/release-fixture_linux_arm64.tar.gz"
      sha256 "ba7b6cd01dad42b64c1d6ffdaa24fbd54bc798b92e34a4f406f7ae4b16a335f4"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.4/release-fixture_linux_x86_64.tar.gz"
      sha256 "d4410fcaa1ef948928094ca093a5f56b7e09f64e353f004a16eb08dc1cc08bdc"
    end
  end

  version "0.1.4" if version.to_s != "0.1.4"

  def install
    bin.install "release-fixture" => "release-fixture-app-free"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture-app-free --version")
  end
end
