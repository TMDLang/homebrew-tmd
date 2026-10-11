class Tmd < Formula
  desc "Modern parser, CLI, and multi-format music rendering toolkit for TMD"
  homepage "https://github.com/TMDLang/TmdSwift"
  url "https://github.com/TMDLang/TmdSwift/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "0e89813c7efb5147c4af35a4823ce85fe604f4103f1c1019c3e1266f7038445e"
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
    assert_equal "0.2.5", shell_output("#{bin}/tmd --version").strip
  end
end
