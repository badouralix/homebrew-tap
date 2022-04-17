class Kubekeeper < Formula
  desc "Safeguard for kubectl"
  homepage "https://github.com/badouralix/kubekeeper"
  url "https://github.com/badouralix/kubekeeper/archive/v1.3.0.tar.gz"
  sha256 "932366a8f56f533df1042eedfcf3bf2e0fa5a67abbf4172c5d65e81fa45d9a57"
  license "MIT"
  head "https://github.com/badouralix/kubekeeper.git", branch: "main"

  depends_on "fzf"
  depends_on "kubernetes-cli"

  def install
    bin.install "src/kubekeeper"
  end

  test do
    assert_match "Client Version", shell_output("#{bin}/kubekeeper --version 2>&1")
  end
end
