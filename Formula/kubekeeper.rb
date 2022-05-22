class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v2.3.0.tar.gz"
  sha256 "2fea65596864a46348ac4b6f0576dbaf3318fc2194ca62ce618c23aae55f495c"
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
