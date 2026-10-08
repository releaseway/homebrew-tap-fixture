# releaseway-version: 1.2.7
# releaseway-source-commit: e2081acd6433fc44284fd79e0faee8e375908408
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.7/release-fixture_macos_arm64.tar.gz"
      sha256 "794ce3715c14da89c3ec5858c6c66b66de7c78f8a5aa0dd95f019b52cf820333"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.7/release-fixture_macos_x86_64.tar.gz"
      sha256 "d68b8a2d08935e564a7132b029af5d66ed78e66876a3a5d1413539959922ec31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.7/release-fixture_linux_arm64.tar.gz"
      sha256 "77fe9daea3692acb4fb3c7e7b070e2f446e473422311dbc5b9d311492445dc32"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.7/release-fixture_linux_x86_64.tar.gz"
      sha256 "0bea6451a87158cba0416db9e1ec3ac0fdc4b7c9044d8b82874801cadfdf97a1"
    end
  end

  def install
    bin.install "release-fixture"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture --version")
  end
end
