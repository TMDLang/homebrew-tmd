class Tmd < Formula
  desc "Modern parser, CLI, and multi-format music rendering toolkit for TMD"
  homepage "https://github.com/TMDLang/TmdSwift"
  url "https://github.com/TMDLang/TmdSwift/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "dafff3e32d3af35e1a4917adb7fbfc433a280a766d291850e09423572ad88a0c"
  license "MIT"
  head "https://github.com/TMDLang/TmdSwift.git", branch: "main"

  on_macos do
    depends_on xcode: ["16.0", :build]
  end

  on_linux do
    depends_on "swift" => :build
  end

  def install
    system "swift", "build",
      "--configuration", "release",
      "--disable-sandbox",
      "--product", "tmd"

    bin.install ".build/release/tmd"
  end

  test do
    assert_match "TMD (Timebase Mark Down)", shell_output("#{bin}/tmd --help")
    assert_equal "0.2.3", shell_output("#{bin}/tmd --version").strip
  end
end
