class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v2.0.0.tar.gz"
  sha256 "a6fdea596f0db64f50bfe5c72cd3761adf83cfa719b509a93746329820d89b7f"
  license "MIT"
  head "https://github.com/badouralix/kubekeeper.git", branch: "main"

  depends_on "kubernetes-cli"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "kubekeeper"
    bin.install "target/release/kubekeeper"
  end

  test do
    assert_match "Client Version", shell_output("#{bin}/kubekeeper --version 2>&1")
  end
end
