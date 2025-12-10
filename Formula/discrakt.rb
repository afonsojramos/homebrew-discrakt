# typed: false
# frozen_string_literal: true

class Discrakt < Formula
  desc "Bridge Trakt.tv watching status to Discord Rich Presence"
  homepage "https://github.com/afonsojramos/discrakt"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "88135d8163219d2fe274733aa46c5b8893d0fc1a8ad3293266bb7b4409d7ca18"
    end
    on_intel do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4561dfdae3ccf292c3e267143eca41d7e1da5d5403216323364fcd19aba0e8be"
    end
  end

  def install
    bin.install "discrakt"
  end

  def caveats
    <<~EOS
      On first run, Discrakt opens a setup wizard in your browser.
      Just enter your Trakt username and you're ready to go!

      Note: Discord must be running on the same machine as Discrakt.

      See https://github.com/afonsojramos/discrakt for more details.
    EOS
  end

  test do
    # Discrakt is a GUI/tray application that requires Discord to be running
    # Just verify the binary exists and is executable
    assert_predicate bin/"discrakt", :exist?
    assert_predicate bin/"discrakt", :executable?
  end
end
