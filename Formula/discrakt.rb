# typed: false
# frozen_string_literal: true

class Discrakt < Formula
  desc "Bridge Trakt.tv watching status to Discord Rich Presence"
  homepage "https://github.com/afonsojramos/discrakt"
  version "3.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c5d2aba03fd81afec771b658503a6ec1f3d8352a18d829e323798c667570139c"
    end
    on_intel do
      url "https://github.com/afonsojramos/discrakt/releases/download/v#{version}/discrakt-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "823c619a110b1a64a44bf659a2228b49db24d55763e61b26bc5df86b4210683a"
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
