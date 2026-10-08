# releaseway-version: 1.2.1
# releaseway-source-commit: c1193204b3cb7d0919422469858a43edd35a10b3
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/c1193204b3cb7d0919422469858a43edd35a10b3.tar.gz"
  version "1.2.1"
  sha256 "abf931f43e7b28e45206bbf4d785d62083b05094a1b1fd511049a44a53463c4a"
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
