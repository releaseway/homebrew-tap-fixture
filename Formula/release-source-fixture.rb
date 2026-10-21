# releaseway-version: 1.2.16
# releaseway-source-commit: bf773b0a6080d28816bf1e83f673fde0b0462101
class ReleaseSourceFixture < Formula
  desc "Deterministic source archive fixture for Homebrew automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/archive/bf773b0a6080d28816bf1e83f673fde0b0462101.tar.gz"
  version "1.2.16"
  sha256 "0c42c606e57936da4f6893597e785a89f8815a51e84f065a1a32bd7005edf270"
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
