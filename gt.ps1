#go to script

while ($true) 
{
    Clear-Host

    $pwdPath = Get-Location
    $title = "Current: " + $pwdPath
    Write-Output $title
    Write-Output ""

    $dirs = Get-ChildItem -Force -Directory
    $nDirs = $dirs.Count

    $symbols = "abcdefghijklmnopqrstuvwxyz"
    
    $possibleOptions = $symbols.Length
    $nLetters = 1
    while ($possibleOptions -lt $nDirs) {
        $nLetters++
        $possibleOptions *= $symbols.Length
    }

    $lettersIndices = 1..$nLetters
    for ($i = 0; $i -lt $nLetters; $i++) {
        $lettersIndices[$i] = 0
    }

    $tagToDir = @{}

    for ($i = 0; $i -lt $dirs.Count; $i++) {
        $dir = $dirs[$i]

        $tag = ""
        for ($j = 0; $j -lt $nLetters; $j++) {
            $tag = $symbols[$lettersIndices[$j]] + $tag
        }

        $tagToDir[$tag] = $dir
        $menuLine = $tag + " - " + $dir.Name

        Write-Output $menuLine

        $letterIndex = 0
        $lettersIndices[$letterIndex] += 1

        while ($lettersIndices[$letterIndex] -eq $symbols.Length) {
            $letterIndex += 1
            $lettersIndices[$letterIndex - 1] = 0
            $lettersIndices[$letterIndex] += 1
        }
    }

    Write-Output ""

    $dirIndex = 0
    $chosenMenuItemIdentifier = ""
    $goBack = $false

    for ($i = 0; $i -lt $nLetters; $i++) {
        $key = [Console]::ReadKey()
        $char = $key.KeyChar
        if ($char -eq ' ') {
            $goBack = $true
            Break
        }
        if ($char -eq '0') {
            Clear-Host
            Exit
        }
        $chosenMenuItemIdentifier += $char
    }

    if ($goBack) {
        cd ..
    } else {
        $chosenDirName = $tagToDir[$chosenMenuItemIdentifier.ToString()]

        cd $chosenDirName
    }
}

