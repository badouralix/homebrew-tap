class Yamlfmt < Formula
  desc "Extensible command-line tool or library to format yaml files"
  homepage "https://github.com/google/yamlfmt"
  url "https://github.com/google/yamlfmt/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "79117ece08bd4175a88a1ec9fed703a10d1573750fe73c6e212d9c62b96e2369"
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
