class Rivs < Formula
  desc "Lightweight native network measurement CLI"
  homepage "https://github.com/arthuran/rivs"
  url "git@github.com:arthuran/rivs.git",
      using:    :git,
      tag:      "v0.7.0",
      revision: "370c277d56abc052ed8e88e37895804e40ae4e0d"
  license "MIT"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def fetch
    system "cargo", "fetch", "--locked"
  end

  def install
    system "cargo", "install", "--locked", "--root=#{prefix}", "--path=.", "--offline"
  end

  test do
    assert_match "rivs 0.7.0", shell_output("#{bin}/rivs --version")
  end
end
