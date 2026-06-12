class TorrentorCli < Formula
  include Language::Python::Virtualenv

  desc "Download torrents from the command line — easy, fast, cross-platform"
  homepage "https://github.com/thaikolja/torrentor-cli"
  url "https://files.pythonhosted.org/packages/source/t/torrentor-cli/torrentor_cli-1.0.0.tar.gz"
  sha256 "bbff5572523ee68b6f4c005338bbb4abddbe82f1d58f5e3dfe66e0ea85cbbfa4"
  license "MIT"

  depends_on "python@3.13"
  depends_on "transmission-cli"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "torrentor", shell_output("#{bin}/torrentor --version")
  end
end
