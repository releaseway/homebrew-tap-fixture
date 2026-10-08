# releaseway-version: 1.2.1
# releaseway-source-commit: c1193204b3cb7d0919422469858a43edd35a10b3
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.1/release-fixture_macos_arm64.tar.gz"
      sha256 "191b5e2c3295e92f3704059f73506e00e3f3536340a5538b6567342b790bad9c"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.1/release-fixture_macos_x86_64.tar.gz"
      sha256 "3cb440571005021e598cab542f8e20ce0e4a857f7d159b4dec3970bd94b3d3bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.1/release-fixture_linux_arm64.tar.gz"
      sha256 "016f716c6832cd67519b4a6039b321f5023dcb469a1918003647965112cb14f2"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.1/release-fixture_linux_x86_64.tar.gz"
      sha256 "ba9d81e6f5907a3420d823c7253b5d6fce633fbf840d3948616c3e452e7b5b18"
    end
  end

  def install
    bin.install "release-fixture"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture --version")
  end
end
