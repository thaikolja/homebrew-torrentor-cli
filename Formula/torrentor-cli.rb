class TorrentorCli < Formula
  include Language::Python::Virtualenv

  desc "Download torrents from the command line — easy, fast, cross-platform"
  homepage "https://github.com/thaikolja/torrentor-cli"
  url "https://files.pythonhosted.org/packages/source/t/torrentor-cli/torrentor_cli-1.0.0.tar.gz"
  sha256 "bbff5572523ee68b6f4c005338bbb4abddbe82f1d58f5e3dfe66e0ea85cbbfa4"
  license "MIT"

  depends_on "python@3.13"
  depends_on "transmission-cli"

  resource "InquirerPy" do
    url "https://files.pythonhosted.org/packages/source/I/InquirerPy/InquirerPy-0.3.4.tar.gz"
    sha256 "89d2ada0111f337483cb41ae31073108b2ec1e618a49d7110b0d7ade89fc197e"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/source/t/typer/typer-0.26.7.tar.gz"
    sha256 "e314a34c617e419c091b2830dda3ea1f257134ff593061a8f5b9717ab8dddb3a"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "torrentor", shell_output("#{bin}/torrentor --version")
  end
end
