# releaseway-version: 1.2.7
# releaseway-source-commit: e2081acd6433fc44284fd79e0faee8e375908408
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/e2081acd6433fc44284fd79e0faee8e375908408.tar.gz"
  version "1.2.7"
  sha256 "3bc6776baab80c280aa7ccaf33d59c028efb5b233a7b11c045a51c3691347406"
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
