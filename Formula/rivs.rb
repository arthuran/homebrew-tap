class Rivs < Formula
  desc "Lightweight native network measurement CLI"
  homepage "https://github.com/arthuran/rivs"
  url "git@github.com:arthuran/rivs.git",
      using:    :git,
      tag:      "v0.5.2",
      revision: "e11412a4f2fa3f742b9fb785bad8cf9540d97039"
  license "MIT"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "fetch", *std_cargo_fetch_args
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "rivs 0.5.2", shell_output("#{bin}/rivs --version")
  end
end
