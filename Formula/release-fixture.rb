# releaseway-version: 1.2.18
# releaseway-source-commit: aba6878789f43add767b0004729062cf1c0d1c73
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.18/release-fixture_macos_arm64.tar.gz"
      sha256 "21ddde9b631c2c0f8d8cf709deb203bedcd8558bb79d9dfcb8a5e2b1f531bd04"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.18/release-fixture_macos_x86_64.tar.gz"
      sha256 "e84370a6bbecb1039a7a1966adbf9b26b164d120258af90de11290e2066751ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.18/release-fixture_linux_arm64.tar.gz"
      sha256 "d5f457593a15a944b175a482fcdfd726709cb808746362e8e1d256a9e7feb65c"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.18/release-fixture_linux_x86_64.tar.gz"
      sha256 "3a69fabb54cf2160cb7541424b74f22a7a7a551deb10d10b400ea53e88bf3b87"
    end
  end

  version "1.2.18" if version.to_s != "1.2.18"

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
