[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $txtfile
)

# collect single character from parenthesis
# each pair of parenthesis enclose only one character
# Usage: .\gatherres.ps1  filename

$debug = $false

$numchars = 0
$regex = '\((.)\)'
$results = ''

foreach($line in Get-Content $txtfile){
    if ($line -match $regex) {
        $numchars += 1
        $results += $Matches.1
        if ($debug)
        {
            Out-Host -InputObject $line 
            Write-Host $Matches.1
        }
    }
}

Write-Host "There are $numchars characters collected."
Write-Host "The collected characters are:" 
Write-Host  $results