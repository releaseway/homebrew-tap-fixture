# releaseway-version: 0.1.1
# releaseway-source-commit: c4f9dc65bd2160e3d132eb124354875ee05d29b3
class ReleaseFixtureAppFree < Formula
  desc "Isolated original-commit release acceptance fixture"
  homepage "https://github.com/releaseway/release-fixture"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.1/release-fixture_macos_arm64.tar.gz"
      sha256 "c5b9710049af19f2c16d6b8c89151cd409535dee4bbbf72de1f0564f752ada13"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.1/release-fixture_macos_x86_64.tar.gz"
      sha256 "cbe604798f27bc195065e455a5172d05e47528b08c1d267c762172968f4dc57d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.1/release-fixture_linux_arm64.tar.gz"
      sha256 "07d358ba161eaa1ab71f1da149d705e5f7bdcbb3b53c74cf36caf2d7cbecbf47"
    end
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/app-free-v0.1.1/release-fixture_linux_x86_64.tar.gz"
      sha256 "3e85d94fa1fdeca59a4ffcc75c031fcbd26ce43e86822dad77fee4821a01d071"
    end
  end

  def install
    bin.install "release-fixture" => "release-fixture-app-free"
  end

  test do
    assert_match "release-fixture #{version}", shell_output("#{bin}/release-fixture-app-free --version")
  end
end
