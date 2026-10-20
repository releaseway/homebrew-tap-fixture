# releaseway-version: 1.2.13
# releaseway-source-commit: f076783a1c10a1cf94231838e802fd4c1e4edac1
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/f076783a1c10a1cf94231838e802fd4c1e4edac1.tar.gz"
  version "1.2.13"
  sha256 "e2f51fd77290c7992ff2ca34c4fdd509f25c9b0412ea352ce5abd1e688dda426"
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
