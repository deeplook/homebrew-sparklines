class Sparklines < Formula
  include Language::Python::Virtualenv

  desc "Generate sparklines for numbers using Unicode characters only"
  homepage "https://github.com/deeplook/sparklines"
  url "https://files.pythonhosted.org/packages/1d/28/ef17c14c68e85b1f987d9ad64aa24f62592154f100206a097ffc545e4510/sparklines-0.7.0.tar.gz"
  sha256 "efd2ff5126dac53ea4212c1e225f286beaf1907b35204465b65010db2eec4b2a"
  license "MIT"
  head "https://github.com/deeplook/sparklines.git", branch: "master"

  depends_on "python@3.14"

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/46/79/cf31d7a93a8fdc6aa0fbb665be84426a8c5a557d9240b6239e9e11e35fc5/termcolor-3.3.0.tar.gz"
    sha256 "348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sparklines --version")
    assert_match "▆▁█", shell_output("#{bin}/sparklines 3 1 4")
  end
end
