class WeatherCli < Formula
  desc "Fast CLI tool to fetch and display weather information"
  homepage "https://github.com/magichrist/weather_cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-macos-aarch64"
      sha256 "94c609d903c811878ec2bf2424e96deab248afb848e4dedb25145b36132379c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-linux-x86_64"
      sha256 "ad491b502044f01a3c66b243f75ab054e01b0ff9b092e4e2906505c88c0ae1cc"
    end
  end

  def install
    bin.install Dir["weather_cli-*"].first => "weather-cli"
  end

  test do
    system "#{bin}/weather-cli", "--help"
  end
end
