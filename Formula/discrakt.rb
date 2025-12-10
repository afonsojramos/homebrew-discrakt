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
      sha256 "PLACEHOLDER_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
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
