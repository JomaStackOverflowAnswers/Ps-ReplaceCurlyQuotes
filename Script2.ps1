function Set-Quotes {
    param (
        [string]
        $Text
    )
    @( 
        @("[`‘`’]", "`'"), 
        @("[`“`”]", "`"")
    ) | ForEach-Object {
        $Text = [System.Text.RegularExpressions.Regex]::Replace($Text, $_[0], $_[1])
    }
    return $Text
}

& tree $PSScriptRoot /f

$names = Get-ChildItem $PSScriptRoot -Directory | Select-Object -ExpandProperty Name

$names | ForEach-Object { 
    Write-Host "$_" -NoNewline -ForegroundColor Magenta
    Write-Host " → " -NoNewline
    Write-Host "$(Set-Quotes -Text $_)" -ForegroundColor Cyan
}