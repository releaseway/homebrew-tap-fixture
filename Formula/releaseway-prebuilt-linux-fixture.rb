# releaseway-version: 1.39633897128.1
# releaseway-source-commit: 4e4d83db268e7dad0f5d04d5b52f46fdbb56982a
class ReleasewayPrebuiltLinuxFixture < Formula
  desc "Native Linux binary fixture for Homebrew platform acceptance"
  homepage "https://github.com/releaseway/release-fixture"
  url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39633897128.1/releaseway-native-fixture_linux_x86_64.tar.gz"
  sha256 "35070f7ac45347ed9eb10264f610fa51ff11875246b601b087a360b127baf355"
  license "MIT"

  depends_on :linux
  on_linux do
    on_intel do
      url "https://github.com/releaseway/release-fixture/releases/download/homebrew-features-1.39633897128.1/releaseway-native-fixture_linux_x86_64.tar.gz"
      sha256 "35070f7ac45347ed9eb10264f610fa51ff11875246b601b087a360b127baf355"
    end
    depends_on arch: :x86_64
  end

  version "1.39633897128.1" if version.to_s != "1.39633897128.1"

  def install
    bin.install "releaseway-native-fixture"
  end

  test do
    assert_match "releaseway-native-fixture #{version} linux/amd64", shell_output("#{bin}/releaseway-native-fixture --version")
  end
end
