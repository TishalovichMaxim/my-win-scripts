if ($args.Count -eq 0) 
{
    Write-Output "No parameters supplied..."
    Break
}

foreach ($arg in $args)
{
    $path = [Environment]::GetEnvironmentVariable('PATH', 'User')
    $newPath = $path + $arg + ";"
    [Environment]::SetEnvironmentVariable('PATH', $newPath, 'User')
}

