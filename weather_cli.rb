
class WeatherCli < Formula
  desc "Fast CLI tool to fetch and display weather information"
  homepage "https://github.com/magichrist/weather_cli"
  version "v0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichrist/weather_cli/releases/download/v0.3.0/weather_cli-macos-aarch64"
      sha256 "9701cd361e5d971b15d0761f88b1b125c89a50aedb49c186d888e859da21f950"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/magichrist/weather_cli/releases/download/v0.3.0/weather_cli-linux-x86_64"
      sha256 "4c0f7343c377f4d54f94db224ca090c8e1defc9b73d17c48ef07ffc399361690"
    end
  end

  def install
    bin.install Dir["weather_cli-*"].first => "weather-cli"
  end

  test do
    system "#{bin}/weather-cli", "--help"
  end
end

