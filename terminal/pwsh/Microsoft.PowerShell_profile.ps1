
# Terminal Icons
Import-Module -Name Terminal-Icons

# Environment Variables
$env:EDITOR = 'nvim'
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# PSReadLine
# Import-Module -Name PSReadLine
# Import-Module -Name CompletionPredictor


# Yazi - Terminal file manager
function yy
{
  $tmp = [System.IO.Path]::GetTempFileName()
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path)
  {
    Set-Location -Path $cwd
  }
  Remove-Item -Path $tmp
}


# PSFzf
# Import-Module PSFzf


# Aliases
Set-Alias v nvim
function vw { nvim -c VimwikiIndex }
function ~ { Set-Location ~ }
function .. { Set-Location .. }
function e { explorer . }
Set-Alias g git


# Zoxide - Directory jumper
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Starship
Invoke-Expression (&starship init powershell)
