& tree $PSScriptRoot /f

$names = Get-ChildItem $PSScriptRoot -File | Select-Object -ExpandProperty Name

$patterns = @( # pattern, replace
    @("[`‘`’]", "`'"), 
    @("[`“`”]", "`"")
)

$names | ForEach-Object{ 
    $name = $_
    $patterns | ForEach-Object{
        $pattern = $_
        $name = [System.Text.RegularExpressions.Regex]::Replace($name,$pattern[0],$pattern[1])
    }
    Write-Host "$_" -NoNewline -ForegroundColor Magenta
    Write-Host " → " -NoNewline
    Write-Host "$name" -ForegroundColor Cyan
}