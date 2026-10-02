# releaseway-version: 1.2.0
# releaseway-source-commit: 52b2edc4ebffdbed2b3b0c3d556e04cdc8ec5da2
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.0/release-fixture_macos_arm64.tar.gz"
      sha256 "314e90e0dc73816fcb53ec0c2bca337ee7ef46292db150e731a0e199000b3501"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.0/release-fixture_macos_x86_64.tar.gz"
      sha256 "2534236db013c25916a62688d2e7d9287b99fe096e42414427178bb870051dcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.0/release-fixture_linux_arm64.tar.gz"
      sha256 "0b877498863952704e698d3c485dc6ceb2050e25edb87d65d26b458b4b281f5c"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.0/release-fixture_linux_x86_64.tar.gz"
      sha256 "3d611561c8fb53a0d14f116881838797316ae07e9c99978908e1a6068e8946ac"
    end
  end

  def install
    bin.install "release-fixture"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture --version")
  end
end
