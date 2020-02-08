# References:
# - https://docs.brew.sh/Formula-Cookbook
# - https://rubydoc.brew.sh/Formula
class Dx < Formula
  desc "Command-line tool to help you manage Docker resources faster"
  homepage "https://github.com/hpedrorodrigues/dx"
  url "https://github.com/hpedrorodrigues/dx/archive/v0.1.1.tar.gz"
  sha256 "576648d402dae3b81ee5f15a8b197e6f4eaa573055f3ab008a3943b182426885"

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
