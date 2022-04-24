class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v2.1.0.tar.gz"
  sha256 "d8e8e96a9333c5767b499ef996348e11a4d7b756eb0651da0fcd10fcc350b678"
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
