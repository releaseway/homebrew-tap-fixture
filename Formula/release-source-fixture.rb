# releaseway-version: 1.2.8
# releaseway-source-commit: e66ab9a3378eb97b51af27480ca33930c010b4be
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/e66ab9a3378eb97b51af27480ca33930c010b4be.tar.gz"
  version "1.2.8"
  sha256 "c3e8da5ee64a402ddcd1c0046efe402add820ae507b83ab95ab58b8140987ba0"
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
