# releaseway-version: 1.2.11
# releaseway-source-commit: 96bfc9d78dfb1d6752260320a89eb364c8cbf022
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/96bfc9d78dfb1d6752260320a89eb364c8cbf022.tar.gz"
  version "1.2.11"
  sha256 "a8cc31565b9504440fe8758c8c79bffa108cf33e18c56a9ee7d0f2597275343d"
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
