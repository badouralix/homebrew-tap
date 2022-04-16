class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  license "MIT"
  head "https://github.com/badouralix/kubekeeper.git", branch: "main"

  depends_on "kubernetes-cli"

  def install
    bin.install "src/kubekeeper"
  end

  test do
    assert_match "Client Version", shell_output("#{bin}/kubekeeper --version 2>&1")
  end
end
