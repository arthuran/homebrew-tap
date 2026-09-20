class ZteCpeMonitor < Formula
  desc "On-demand CLI and temporary dashboard for compatible ZTE CPE radio status"
  homepage "https://github.com/arthuran/zte-cpe-monitor"
  url "https://github.com/arthuran/zte-cpe-monitor.git",
      tag:      "v0.2.0",
      revision: "5ce8d0cfb7eea2748223ea1b55e3a67d4a9de90c"
  license "MIT"

  depends_on "python@3.14"

  def install
    inreplace "zte_cpe.py",
              "#!/usr/bin/env python3",
              "#!#{Formula["python@3.14"].opt_bin}/python3.14"
    bin.install "zte_cpe.py" => "zte-cpe"
  end

  test do
    assert_match "zte-cpe 0.2.0", shell_output("#{bin}/zte-cpe --version")
  end
end
