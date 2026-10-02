# releaseway-version: 1.2.0
# releaseway-source-commit: 52b2edc4ebffdbed2b3b0c3d556e04cdc8ec5da2
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/52b2edc4ebffdbed2b3b0c3d556e04cdc8ec5da2.tar.gz"
  version "1.2.0"
  sha256 "3129fe9f2a08cd1d420754a62a4eeea635f6406d50b71cc6121bef8695f60072"
  license "MIT"

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
