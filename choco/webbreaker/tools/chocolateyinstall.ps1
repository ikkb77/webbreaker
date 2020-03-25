$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'webbreaker.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  #url           = $url
  #url64bit      = $url64
  file         = $fileLocation

  softwareName  = 'webbreaker*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '2F281483D0D0933C145C18B54564DE6ADA06E8B5366326A7F4E28C32F1824B9E'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '2F281483D0D0933C145C18B54564DE6ADA06E8B5366326A7F4E28C32F1824B9E'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 