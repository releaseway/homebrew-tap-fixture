# releaseway-version: 1.2.15
# releaseway-source-commit: 54831013cb33f6aebe2ecf26b84d858c01164182
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/54831013cb33f6aebe2ecf26b84d858c01164182.tar.gz"
  version "1.2.15"
  sha256 "a993a816c4de44ba7ead47afeec105db60f79c7c6058758c59b0260b2dc6cfa4"
  license "MIT"
  version_scheme 1

  def install
    target = bin/"release-source-fixture"
    target.write <<~SH
      #!/usr/bin/env sh
      echo "release-source-fixture #{version}"
    SH
    target.chmod 0755

    unless (bin/"release-source-fixture").file?
      odie "command_aliases.rw-source-fixture: target release-source-fixture must be an installed executable"
    end
    unless (bin/"release-source-fixture").executable?
      odie "command_aliases.rw-source-fixture: target release-source-fixture must be an installed executable"
    end
    if (bin/"rw-source-fixture").exist? || (bin/"rw-source-fixture").symlink?
      odie "command_aliases.rw-source-fixture: destination already exists"
    end
    bin.install_symlink (bin/"release-source-fixture") => "rw-source-fixture"
  end

  test do
    ["release-source-fixture", "rw-source-fixture"].each do |command|
      assert_match "release-source-fixture #{version}", shell_output((bin/command).to_s)
    end
  end
end
