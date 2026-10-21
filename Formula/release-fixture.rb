# releaseway-version: 1.2.15
# releaseway-source-commit: 54831013cb33f6aebe2ecf26b84d858c01164182
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.15/release-fixture_macos_arm64.tar.gz"
      sha256 "d33157127a9d8970400016e2106b981116432204d1c130f2ade8fe2a9df42319"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.15/release-fixture_macos_x86_64.tar.gz"
      sha256 "c8fe0cb69b7457784716b6053f9fd77982bab9726f98da41d5467b3040c1b081"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.15/release-fixture_linux_arm64.tar.gz"
      sha256 "535b77b98ed509d71d010740d8ad23b3a3e3278cc4d09ca297c334cafc93fcdf"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.15/release-fixture_linux_x86_64.tar.gz"
      sha256 "a2063223e72ccc68543263b494fdc72ff368e11dee604aeea12559a02c765e57"
    end
  end

  version "1.2.15" if version.to_s != "1.2.15"

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
