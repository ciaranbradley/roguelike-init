<#
.SYNOPSIS
    Quickstart for the roguelike emacs config

.DESCRIPTION
    Clone the roguelike git repo, download and install outside dependencies (fonts etc).

.EXAMPLE
    PS C:\> ./startup.ps1

.NOTES
    Author: Ciaran Bradley
    Last Edit: 2024-11-11
    Version 0.1 - First draft

#>

## TODO - Install emacs using zip?
## TODO - Install fonts
## TODO - Install grep and other goodies

## Helper functions

function Log-Message {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )

    # Format the output with a timestamp and log level
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $formattedMessage = "[$timestamp] [$Level] $Message"
    Write-Output $formattedMessage
}

## Variables

## Remote
$emacsSigUrl = "http://ftp.wayne.edu/gnu/emacs/windows/emacs-29/emacs-29.3.zip.sig"

$emacsDownloadUrl = "http://ftp.wayne.edu/gnu/emacs/windows/emacs-29/emacs-29.3.zip"

$roguelikeGitRepoUrl = "https://github.com/ciaranbradley/roguelike"

## Local
$emacsFolderPath = ".emacs.d"

$roamingFolderPath = "$HOME\AppData\Roaming\"

## Check for existing .emacs.d

Log-Message "Checking for existing .emacs.d at $emacsFolderPath"

Log-Message "$roamingFolderPath$emacsFolderPath"

if (Test-Path -Path "$roamingFolderPath$emacsFolderPath") {
   
    $randomNumber = Get-Random -Minimum 10000 -Maximum 100000
    $backupFolderPath = "emacs-$randomNumber.d"
    Log-Message "Folder exists. Backing up to $roamingFolderPath$backupFolderPath"
    Move-Item -Path $roamingFolderPath$emacsFolderPath -Destination $roamingFolderPath$backupFolderPath -WhatIf

} else {
    Log-Message "Folder does not exist. Continuing with installation."
}


## Clone roguelike into emacs directory
Log-Message "Cloning roguelike to .emacs.d"
git clone $roguelikeGitRepoUrl "$roamingFolderPath$emacsFolderPath"

