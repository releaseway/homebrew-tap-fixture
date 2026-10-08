# releaseway-version: 1.2.5
# releaseway-source-commit: fd3468b3737bb0f9e9646466bbdd369d464e5f1f
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/fd3468b3737bb0f9e9646466bbdd369d464e5f1f.tar.gz"
  version "1.2.5"
  sha256 "7383a294931d22374dc041a164cefda2d32a18407d41bf0d8ad567f87403e1be"
  license "MIT"
  version_scheme 1

  def install
    target = bin/"release-source-fixture"
    target.write <<~SH
      #!/usr/bin/env sh
      echo "release-source-fixture #{version}"
    SH
    target.chmod 0755
  end

  test do
    assert_match "release-source-fixture #{version}", shell_output(bin/"release-source-fixture")
  end
end
