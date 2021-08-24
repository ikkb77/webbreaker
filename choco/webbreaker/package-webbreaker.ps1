Param ($version="v2.2.0")

# Download url
$webbreaker_winexe="https://github.com/webbreaker/webbreaker/releases/download/"+$version+"/webbreaker-win-10.exe"

# Download latest webbreaker
Invoke-WebRequest -Uri $webbreaker_winexe -OutFile "tools/webbreaker.exe"
# Package Webbreaker
choco pack

# Upload Package
# Consider using a github action for this.
#choco push .\webbreaker.2.2.0.nupkg --source https://push.chocolatey.org/