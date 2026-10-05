class Midplay < Formula
  desc "Terminal MIDI file player (Audio Unit / FluidSynth, CoreMIDI / ALSA)"
  homepage "https://github.com/mikuta0407/midplay"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikuta0407/midplay/releases/download/v0.1.0/midplay-v0.1.0-macos-arm64.tar.gz"
      sha256 "38280c6a86d60a600e9ba28fc737b5318928cb1c1b4d94ff0cc8385581cd59f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mikuta0407/midplay/releases/download/v0.1.0/midplay-v0.1.0-linux-arm64.tar.gz"
      sha256 "71023555e92ffc246d915839518ae9ff20d7cdfb49d075d217fd5507676fc3b1"
    end
    on_intel do
      url "https://github.com/mikuta0407/midplay/releases/download/v0.1.0/midplay-v0.1.0-linux-amd64.tar.gz"
      sha256 "ab6ea8b27eb1c1075f1b212d84effb5fed60f38b937c8e1e484c9ac7bc00e8f6"
    end
  end

  def install
    bin.install "midplay"
    doc.install "LICENSE", "README.md"
  end

  def caveats
    on_linux do
      <<~CAVEATS
        midplay uses the system's ALSA and FluidSynth libraries and a SoundFont:
          sudo apt install libasound2 libfluidsynth3 fluid-soundfont-gm
        (libasound2t64 on Ubuntu 24.04 and later)
      CAVEATS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/midplay --version")
  end
end
