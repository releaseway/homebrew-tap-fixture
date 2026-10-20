# releaseway-version: 1.2.12
# releaseway-source-commit: a4411a248181b1415b512348282c09a135549ac8
class ReleaseFixture < Formula
  desc "Deterministic release asset fixture for automation integration tests"
  homepage "https://github.com/releaseway/release-fixture"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.12/release-fixture_macos_arm64.tar.gz"
      sha256 "787b42418f7ff3dd5832e7a6443fa9d3eb29676b74d3b7a10a0177ceda77429e"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.12/release-fixture_macos_x86_64.tar.gz"
      sha256 "8d3b4320af86099fdb794a40d5d3c6313cac44f955821199771e34f5c0cd5f7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.12/release-fixture_linux_arm64.tar.gz"
      sha256 "4d525a2a436221192dec31e5b198925741f39d902307020a4918d14c36ac3401"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/v1.2.12/release-fixture_linux_x86_64.tar.gz"
      sha256 "31a49b4e8efaac3c262b6ee70fba6cb67f41a34867186c3e41688337b9543ea2"
    end
  end

  version "1.2.12" if version.to_s != "1.2.12"

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
