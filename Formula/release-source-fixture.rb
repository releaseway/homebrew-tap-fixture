# releaseway-version: 1.2.12
# releaseway-source-commit: a4411a248181b1415b512348282c09a135549ac8
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/a4411a248181b1415b512348282c09a135549ac8.tar.gz"
  version "1.2.12"
  sha256 "5af4863d94ce245e7bf6191d77e6ee4616f33a8494e004fb103bffaf63c0ccbe"
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
