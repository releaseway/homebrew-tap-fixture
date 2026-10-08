# releaseway-version: 1.2.8
# releaseway-source-commit: e66ab9a3378eb97b51af27480ca33930c010b4be
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.8/release-fixture_macos_arm64.tar.gz"
      sha256 "39ec5609550dfd0e2366fae80cdc6514d3cee6245067105c9c95fe27ac599603"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.8/release-fixture_macos_x86_64.tar.gz"
      sha256 "eadeac1e6113b96851b47650dd63e05e8a849e151010d56d5c5c7801901bf01c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.8/release-fixture_linux_arm64.tar.gz"
      sha256 "21a13949910ed1493d2d6049f0ba2b5ab91d171806f5be9cbd2de061739fa39b"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.8/release-fixture_linux_x86_64.tar.gz"
      sha256 "7382f03ab60340e9dc4bd3becda75f31360028a26485f1de5e4ac0bbbe477f20"
    end
  end

  def install
    bin.install "release-fixture"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture --version")
  end
end
