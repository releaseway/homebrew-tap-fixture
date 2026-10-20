# releaseway-version: 0.1.2
# releaseway-source-commit: 78733427ac8c1399b669a23f861a14da13d40850
class ReleaseFixtureAppFree < Formula
  desc "Isolated original-commit release acceptance fixture"
  homepage "https://github.com/releaseway/release-fixture"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.2/release-fixture_macos_arm64.tar.gz"
      sha256 "6382b8c52b549d9d0efe398a971df06c0bb6c296be45859f2cf104b69c889dbf"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.2/release-fixture_macos_x86_64.tar.gz"
      sha256 "e717ad317d20a3527d193350ecc83e39f3d1d55b9b2fcfc5c6e1941d6c5074c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.2/release-fixture_linux_arm64.tar.gz"
      sha256 "13cabdfc064b8ce2362c4a2ebf2ce37ebd019cd251cae279060b071b0dcc70e7"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.2/release-fixture_linux_x86_64.tar.gz"
      sha256 "99874be1527e51bd332b2a527a0a5e44bb2a1fd7d51107ef41a999ca40e0a59f"
    end
  end

  def install
    bin.install "release-fixture" => "release-fixture-app-free"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture-app-free --version")
  end
end
