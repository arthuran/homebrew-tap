class Rivs < Formula
  desc "Lightweight native network measurement CLI"
  homepage "https://github.com/arthuran/rivs"
  url "git@github.com:arthuran/rivs.git",
      using:    :git,
      tag:      "v0.6.2",
      revision: "30d5b6756b676f2ebacf1a7371dd6c42a7f6f97e"
  license "MIT"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "fetch", *std_cargo_fetch_args
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "rivs 0.6.2", shell_output("#{bin}/rivs --version")
  end
end
