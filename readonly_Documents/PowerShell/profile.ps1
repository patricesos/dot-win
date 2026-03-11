if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

function em {
  param($1)
  emacsclient -c -n -a "" $1
}

New-Alias vi nvim
function install-komorebi { scoop install komorebi whkd autohotkey }

function ll { eza -axl --icons=always --group-directories-first }

hugo completion powershell | Out-String | Invoke-Expression
function github { githubdesktop . }
function pw { pwsh -nol }
function ip { ipconfig }
function moho {
    C:\Program` Files\Moho` 14\Moho.exe
}

function setup-lazyvim { git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim && Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force }
function backup-lazyvim { Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak && Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak }
function remove-lazyvim { rm -rf $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak && rm -rf $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak }

function env { .\.venv\Scripts\Activate.ps1 }
function lz { $env:NVIM_APPNAME = "lazy"; nvim }
function anime { viu anilist }
function mpv-edit { nvim "F:\software\mpv\portable_config" }
function SymLink {
    param ( $Target, $Path )
    New-Item -ItemType SymbolicLink -Path $Path -Target $Target
}

function c. { code . }
function ex { explorer . }
function ex. { explorer . }

function audio {
    param($link)
    yt-dlp -o $env:userprofile/downloads/music/"%(title)s.%(ext)s" -x --audio-format mp3 $link
}

function hd {
    param($link)
    yt-dlp -o $env:userprofile/downloads/video/"%(title)s.%(ext)s" -f "140+136" $link
}

function fhd {
    param($link)
    yt-dlp -o $env:userprofile/downloads/video/"%(title)s.%(ext)s" -f "140+137" $link
}

function insta {
    param($link)
    yt-dlp -o $env:userprofile/downloads/video/"%(title)s.%(ext)s" -f "ba+bv" $link --cookies-from-browser firefox
}

function video {
    param($link)
    yt-dlp -o $env:userprofile/downloads/video/"%(title)s.%(ext)s" -f "ba+bv" $link
}

function global {
    $globalVenvPath = "$HOME/.global-venv"
    if (Test-Path $globalVenvPath) {
        & "$globalVenvPath/Scripts/Activate.ps1"
    }
    else {
        Write-Output "No virtual environment found in .venv or ~/.global-venv"
    }
}

function gaffer-edit {
    nvim f:/software/gaffer/gaffer.bat
}

function bt {
    param($opt)
    beet im $opt
}

# chezmoi aliases
function ce { nvim ~/.local/share/chezmoi/}
function cu { chezmoi update }
function ca { chezmoi -v apply }
function chcd { chezmoi cd }


# Docker
function DockerComposeUp { docker compose up -d }
function DockerComposeDown { docker compose down }
function DockerComposeFile {
    param($opt)
    docker compose -f $opt up -d
}

function GafferDebug {
    param (
        [Parameter(Mandatory = $true)]
        [string]$gaffer,
        [string]$run
    )
    $env:GAFFER_DEBUG = 1
    if ($run) {
        & $gaffer $run
    }
    else {
        & $gaffer
    }
}

