# releaseway-version: 1.2.5
# releaseway-source-commit: fd3468b3737bb0f9e9646466bbdd369d464e5f1f
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.5/release-fixture_macos_arm64.tar.gz"
      sha256 "bd2c68f8f5dd6321ef2a016000d19621f64982549aebcac6877fc9db86dbde27"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.5/release-fixture_macos_x86_64.tar.gz"
      sha256 "fc5402d3ed351ccda4d20f867a00afb3b62360a2685bb349d8c381f3cea931cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.5/release-fixture_linux_arm64.tar.gz"
      sha256 "114622aa58c55ef33efa17e7a80544282207e720e4a0591ac32d00151358970c"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.5/release-fixture_linux_x86_64.tar.gz"
      sha256 "f5547d32ba1be8677be0eb67908dfc8195351e274533dd5c30379e8ad3b5e302"
    end
  end

  def install
    bin.install "release-fixture"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture --version")
  end
end
