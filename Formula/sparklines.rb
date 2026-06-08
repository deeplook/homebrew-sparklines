class Sparklines < Formula
  include Language::Python::Virtualenv

  desc "Generate sparklines for numbers using Unicode characters only"
  homepage "https://github.com/deeplook/sparklines"
  url "https://files.pythonhosted.org/packages/be/52/3e3c437c665397047e2c9364e27f53f85024c57fe990f422a30593fd8c98/sparklines-1.0.0.tar.gz"
  sha256 "eee3ed5ac6dc954096ab092ce336941050eca790e2f33f85de65a4ea0a43cf74"
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
