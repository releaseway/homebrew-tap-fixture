# releaseway-version: 1.2.14
# releaseway-source-commit: e9b97b0cdfafc316717ef23e092130daeea463a9
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.14/release-fixture_macos_arm64.tar.gz"
      sha256 "2f1bd4900bc732b5fbcf4b624f21fcfd6f4705f70eec2a77956d5ab63d395ed1"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.14/release-fixture_macos_x86_64.tar.gz"
      sha256 "94eb7890e602f0b6a168d09da18cd643070d1a46694da59d3cb707e87a235123"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.14/release-fixture_linux_arm64.tar.gz"
      sha256 "18cd3c487c98c6086884b974e4d744b9094868aef5d20ec09613290a6c9e0ca4"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.14/release-fixture_linux_x86_64.tar.gz"
      sha256 "5dcd147acefc9740bb33e164b74b61baf1d8d484c390e2f7fbb87e56dbc8fe7e"
    end
  end

  version "1.2.14" if version.to_s != "1.2.14"

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
