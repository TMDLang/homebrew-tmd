class Tmd < Formula
  desc "Modern parser, CLI, and multi-format music rendering toolkit for TMD"
  homepage "https://github.com/TMDLang/TmdSwift"
  url "https://github.com/TMDLang/TmdSwift/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8ab98537e3128b76987ddbe173bb3bafab5761841ce067b374f1e5143d07c947"
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
  end
end
