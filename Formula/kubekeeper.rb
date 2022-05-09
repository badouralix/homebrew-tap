class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v2.2.0.tar.gz"
  sha256 "f09a51e129ce1fc77e78fa9ae9c1add5db70c93ba0d62a64682cd0d06e1147b3"
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
