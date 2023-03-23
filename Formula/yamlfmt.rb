class Yamlfmt < Formula
  desc "Simple command line tool for formatting yaml files"
  homepage "https://github.com/google/yamlfmt"
  url "https://github.com/google/yamlfmt/archive/v0.8.0.tar.gz"
  sha256 "91fa9715108aa7cf62180a89c33ec797ec923f94af8f7e8ff96870fd3ccb12e5"
  license "Apache-2.0"
  head "https://github.com/google/yamlfmt.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/yamlfmt"
  end

  test do
    assert_match "yamlfmt", shell_output("#{bin}/yamlfmt --help 2>&1")
  end
end
