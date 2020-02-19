# References:
# - https://docs.brew.sh/Formula-Cookbook
# - https://rubydoc.brew.sh/Formula
class Dx < Formula
  desc "Command-line tool to help you manage Docker resources faster"
  homepage "https://github.com/hpedrorodrigues/dx"
  url "https://github.com/hpedrorodrigues/dx/archive/v0.1.2.tar.gz"
  sha256 "34fbf7d27fde91a54cbd4ea16bf477087011f0193eac724540f3c6883888dde3"

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
