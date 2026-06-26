import json
import subprocess
import os

result = subprocess.run(
    [
        "gh",
        "release",
        "view",
        "--repo",
        "magichrist/weather_cli",
        "--json",
        "assets",
    ],
    capture_output=True,
    text=True,
    check=True,
)

json_data = json.loads(result.stdout)["assets"]
version=json_data[0]['url'].split("download/")[1].split("/")[0]
for i in range(len(json_data)):
    name = json_data[i]["name"].split("-")
    url = json_data[i]["url"]
    digest = json_data[i]["digest"].split(":")[1]
    if "linux" in name and "x86_64" in name:
        linux_x86_64_url = url
        linux_x86_64_digest = digest
    if "linux" in name and "aarch64" in name:
        linux_aarch64_url = url
        linux_aarch64_digest = digest
    if "macos" in name and "x86_64" in name:
        macos_x86_64_url = url
        macos_x86_64_digest = digest
    if "macos" in name and "aarch64" in name:
        macos_aarch64_url = url
        macos_aarch64_digest = digest

formula = f"""
class WeatherCli < Formula
  desc "Fast CLI tool to fetch and display weather information"
  homepage "https://github.com/magichrist/weather_cli"
  version "{version}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "{macos_aarch64_url}"
      sha256 "{macos_aarch64_digest}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "{linux_x86_64_url}"
      sha256 "{linux_x86_64_digest}"
    end
  end

  def install
    bin.install Dir["weather_cli-*"].first => "weather-cli"
  end

  test do
    system "#{{bin}}/weather-cli", "--help"
  end
end
"""

os.system(f"echo '{formula}' > ./weather_cli.rb")
os.system(f"git add . && git commit -m '{version}' && git push")
