# References:
# - https://docs.brew.sh/Formula-Cookbook
# - https://rubydoc.brew.sh/Formula
class Dx < Formula
  desc "Command-line tool to help you manage Docker resources faster"
  homepage "https://github.com/hpedrorodrigues/dx"
  url "https://github.com/hpedrorodrigues/dx/archive/v0.1.3.tar.gz"
  sha256 "8803665890e803587b0cd1f6a60ff3e9dd584c1ffecb540e06e3b300eb25a1a0"

  def install
    bin.install "dx"
    prefix.install "commands"

    inreplace "#{bin}/dx" do |s|
      s.gsub! /DX_HOME=.*/, "DX_HOME=\"#{prefix}\""
    end

    bash_completion.install "completion/dx.bash" => "dx"
    zsh_completion.install "completion/_dx.zsh" => "_dx"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/dx --help")
  end
end
