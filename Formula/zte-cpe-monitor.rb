class ZteCpeMonitor < Formula
  desc "On-demand CLI and temporary dashboard for compatible ZTE CPE radio status"
  homepage "https://github.com/arthuran/zte-cpe-monitor"
  url "https://github.com/arthuran/zte-cpe-monitor.git",
      tag:      "v0.1.0",
      revision: "54a7664eb2b1fcd3ebb2ed5adc911832a2555330"
  license "MIT"

  depends_on "python@3.14"

  def install
    inreplace "zte_cpe.py",
              "#!/usr/bin/env python3",
              "#!#{Formula["python@3.14"].opt_bin}/python3.14"
    bin.install "zte_cpe.py" => "zte-cpe"
  end

  test do
    assert_match "zte-cpe 0.1.0", shell_output("#{bin}/zte-cpe --version")
  end
end
