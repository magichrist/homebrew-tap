class WeatherCli < Formula
  desc "Fast CLI tool to fetch and display weather information"
  homepage "https://github.com/magichrist/weather_cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-macos-aarch64.gz"
      sha256 "b0f831e8f589397a83f52b62dc4fcc5cfa3ff55a44ccbf4e6d4f3299e670ae99"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/magichrist/weather_cli/releases/download/v#{version}/weather_cli-linux-x86_64.gz"
      sha256 "740c6f183321d362efe63cac932061a3297f0c2266c8642c3ac955785c636bdc"
    end
  end

  def install
    bin.install Dir["weather_cli-*"].first => "weather-cli"
  end

  test do
    system "#{bin}/weather-cli", "--help"
  end
end
