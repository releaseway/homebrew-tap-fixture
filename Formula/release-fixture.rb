# releaseway-version: 1.2.9
# releaseway-source-commit: a2ffd79a43bf9b199189ba7afea22a2f96ab774c
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.9/release-fixture_macos_arm64.tar.gz"
      sha256 "2e596e11cbbd7a43cc72c57d69e163e115d808c43efb2913ae08c88b56a06518"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.9/release-fixture_macos_x86_64.tar.gz"
      sha256 "74a601e4905b0454b2c0ab273ebc21deeee63e7eab4c0ba532f99d21faa366c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.9/release-fixture_linux_arm64.tar.gz"
      sha256 "4eec6c51f322a56dad9826cbe41159356940833b4b9e7ca603fd05ae8e3515bc"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.9/release-fixture_linux_x86_64.tar.gz"
      sha256 "87906e239606b9cf3342f12ff4e726f99597a76f45e41d9ca0708c08230d48f6"
    end
  end

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
