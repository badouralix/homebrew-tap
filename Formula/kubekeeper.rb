class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v2.0.2.tar.gz"
  sha256 "47f03f72aa46ec43ea49e5bebac67685ad5f8a402e2818721a7f7d6bf19c497c"
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
