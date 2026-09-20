class ZteCpeMonitor < Formula
  desc "On-demand CLI and temporary dashboard for compatible ZTE CPE radio status"
  homepage "https://github.com/arthuran/zte-cpe-monitor"
  url "https://github.com/arthuran/zte-cpe-monitor.git",
      tag:      "v0.2.1",
      revision: "b4e5a15c17d22b94061bf3911d84b0d27f445c91"
  license "MIT"

  depends_on "python@3.14"

  def install
    inreplace "zte_cpe.py",
              "#!/usr/bin/env python3",
              "#!#{Formula["python@3.14"].opt_bin}/python3.14"
    bin.install "zte_cpe.py" => "zte-cpe"
  end

  test do
    assert_match "zte-cpe 0.2.1", shell_output("#{bin}/zte-cpe --version")
  end
end
