class Yamlfmt < Formula
  desc "Extensible command-line tool or library to format yaml files"
  homepage "https://github.com/google/yamlfmt"
  url "https://github.com/google/yamlfmt/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "876d8034f689ea053421eddb6654f76ef9fa18b8400146dff78729ead90fbd69"
  license "Apache-2.0"
  head "https://github.com/google/yamlfmt.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w"
    system "go", "build", *std_go_args(ldflags:), "./cmd/yamlfmt"
  end

  test do
    assert_match "yamlfmt", shell_output("#{bin}/yamlfmt --help 2>&1")
  end
end
