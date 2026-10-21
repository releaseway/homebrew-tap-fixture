# releaseway-version: 1.2.16
# releaseway-source-commit: bf773b0a6080d28816bf1e83f673fde0b0462101
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.16/release-fixture_macos_arm64.tar.gz"
      sha256 "4b004f90a4098d2ffb715ce62b33c30a5e70eaf644b37a7225f6779066afe713"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.16/release-fixture_macos_x86_64.tar.gz"
      sha256 "0d015624e7d4c04ba6d39446e6010373fb96e9a3dc33a8b173dbbf733cd4d8dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.16/release-fixture_linux_arm64.tar.gz"
      sha256 "13ec741a3e78766d134b1214deb82c62cf2c64f4d01e5eb77562ff93a8041394"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.16/release-fixture_linux_x86_64.tar.gz"
      sha256 "4a21bd1451824abfa972c2742f291342f41b3d04a51d5b6afcd0a8e91c669b78"
    end
  end

  version "1.2.16" if version.to_s != "1.2.16"

  def install
    bin.install "release-fixture"

    unless (bin/"release-fixture").file?
      odie "command_aliases.release-fixture-cli: target release-fixture must be an installed executable"
    end
    unless (bin/"release-fixture").executable?
      odie "command_aliases.release-fixture-cli: target release-fixture must be an installed executable"
    end
    if (bin/"release-fixture-cli").exist? || (bin/"release-fixture-cli").symlink?
      odie "command_aliases.release-fixture-cli: destination already exists"
    end
    unless (bin/"release-fixture").file?
      odie "command_aliases.rw-fixture: target release-fixture must be an installed executable"
    end
    unless (bin/"release-fixture").executable?
      odie "command_aliases.rw-fixture: target release-fixture must be an installed executable"
    end
    if (bin/"rw-fixture").exist? || (bin/"rw-fixture").symlink?
      odie "command_aliases.rw-fixture: destination already exists"
    end
    bin.install_symlink (bin/"release-fixture") => "release-fixture-cli"
    bin.install_symlink (bin/"release-fixture") => "rw-fixture"
  end

  test do
    ["release-fixture", "rw-fixture", "release-fixture-cli"].each do |command|
      assert_match "release-fixture #{version}", shell_output("#{bin}/#{command} --version")
    end
  end
end
