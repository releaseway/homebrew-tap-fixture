# releaseway-version: 1.2.13
# releaseway-source-commit: f076783a1c10a1cf94231838e802fd4c1e4edac1
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.13/release-fixture_macos_arm64.tar.gz"
      sha256 "ff84c141e1e0a66344a6123a37df237fe7a1087aee3fe8bbfec049067a1446ed"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.13/release-fixture_macos_x86_64.tar.gz"
      sha256 "90bdea0ad192330cc9002ba0650027cee6fc15f6dd94d19c8b440195431da245"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.13/release-fixture_linux_arm64.tar.gz"
      sha256 "4eab6db84e8f2487ad6ed23fbd6051dcd7e1ea6ac83974afbd4e048d356a2ab6"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.13/release-fixture_linux_x86_64.tar.gz"
      sha256 "1fd7eb152a6bf09948b6621685103e775095c17b48c49fe1294572301c856ab0"
    end
  end

  version "1.2.13" if version.to_s != "1.2.13"

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
