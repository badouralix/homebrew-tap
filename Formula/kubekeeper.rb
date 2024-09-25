class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "709cadb8a004bcd3db4bd0ff803a82bdece627545b0ce2ee269693f356816e29"
  license "MIT"
  head "https://github.com/badouralix/kubekeeper.git", branch: "main"

  depends_on "rust" => :build
  depends_on "kubernetes-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Client Version", shell_output("#{bin}/kubekeeper version --client 2>&1")
  end
end
