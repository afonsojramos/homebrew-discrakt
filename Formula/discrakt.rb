# typed: false
# frozen_string_literal: true

class Discrakt < Formula
  desc "Bridge Trakt.tv watching status to Discord Rich Presence"
  homepage "https://github.com/afonsojramos/discrakt"
  version "4.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b23395acbe93f46ada5d0f83f55ff874add5db657a910d54f5597ba08e9aa139"
    end
    on_intel do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b11ae5f22d8fcfe7257958b3614e0f723c1d4953ae14cd0943b241199957a839"
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
