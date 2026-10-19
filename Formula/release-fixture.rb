# releaseway-version: 1.2.10
# releaseway-source-commit: e27e31d2c24e77bafa9e74f5d453ec7783ba28c7
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.10/release-fixture_macos_arm64.tar.gz"
      sha256 "be9afd52398b7a5ad07ac8af98a0eb766a619718d4003a541ea4e37c3fd2d82a"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.10/release-fixture_macos_x86_64.tar.gz"
      sha256 "9870d1d1073d5876a83be7194e4e000a75e1f0d56deda32f78cc0e86565a3f0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.10/release-fixture_linux_arm64.tar.gz"
      sha256 "a41174a2c5f9e2daf1ffb9d2aca993b4be148e028063455664aaea758731b9b2"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.10/release-fixture_linux_x86_64.tar.gz"
      sha256 "014fb761668a465801446112cd9f874e5caea81f1baec8da27861ffc7e4e6b17"
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
