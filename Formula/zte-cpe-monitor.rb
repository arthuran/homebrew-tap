class ZteCpeMonitor < Formula
  desc "On-demand CLI and temporary dashboard for compatible ZTE CPE radio status"
  homepage "https://github.com/arthuran/zte-cpe-monitor"
  url "https://github.com/arthuran/zte-cpe-monitor.git",
      tag:      "v0.1.0",
      revision: "28c10d847b5919e8962d5a7ce87048a3c3b2cece"
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
