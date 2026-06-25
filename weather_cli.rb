class WeatherCli < Formula
  desc "Fast CLI tool to fetch and display weather information"
  homepage "https://github.com/magichrist/weather_cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-macos-aarch64"
      sha256 "b5848cf04d123489cca8714484f1796885c9d02db34297e39642770c0f34f114"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-linux-x86_64"
      sha256 "5e183be5127b1952a57e9badc69436444f7a4a91d593fb11300c9da514c38bba"
    end
  end

  def install
    bin.install Dir["weather_cli-*"].first => "weather-cli"
  end

  test do
    system "#{bin}/weather-cli", "--help"
  end
end
