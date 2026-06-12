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
    venv = virtualenv_create(libexec)
    system venv.root/"bin/pip", "install", "torrentor-cli==#{version}"
    bin.install_symlink venv.root/"bin/torrentor"
  end

  test do
    assert_match "torrentor", shell_output("#{bin}/torrentor --version")
  end
end
