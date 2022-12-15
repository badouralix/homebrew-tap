class FoundationdbHeadersAT6230 < Formula
  desc "FoundationDB C bindings"
  homepage "https://apple.github.io/foundationdb"
  url "https://github.com/apple/foundationdb/archive/6.2.30.tar.gz"
  sha256 "49755993ac5cbc504a48cbdde6f5e34f70b21ff587250210d0d735037423cafc"
  license "Apache-2.0"
  head "https://github.com/apple/foundationdb.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "mono" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "make", "-C", "build/bindings/c/", "fdb_c_options"

    (include/"foundationdb").install Dir["bindings/c/foundationdb/*"], Dir["build/bindings/c/foundationdb/*"]
  end

  test do
    assert_match "FDB_C_H", File.read(include/"foundationdb/fdb_c.h")
  end
end
