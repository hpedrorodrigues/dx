# References:
# - https://docs.brew.sh/Formula-Cookbook
# - https://rubydoc.brew.sh/Formula
class Dx < Formula
  desc "Command-line tool to help you manage local Docker resources faster"
  homepage "https://github.com/hpedrorodrigues/dx"
  url "https://github.com/hpedrorodrigues/dx/archive/v0.1.6.tar.gz"
  sha256 "92a4113040d478aa377a44547d470ff61f01ad0e4e072419e5b02c964a52479b"

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
