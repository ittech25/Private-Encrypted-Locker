
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$desktop = [Environment]::GetFolderPath("Desktop") 
$templockdir = "$desktop\Locker"
$lockedfiles = Get-ChildItem -Path "$templockdir" -Include "*$extension" -Recurse
$pcname = $env:computername
$lockerkeys = "$dir\lockerkeys"
$extension = (Get-Content -Path $dir\settings.db -TotalCount 2)[-1]

Get-Content -Path "$dir\version"

Import-Module $dir\encrypt.psm1 3>$null

# Check if key exists for Target PC.
if(!(Test-Path $lockerkeys\"$pcname".key)){
Write-Host "No Key present for this Machine."
write-host "`n"
}
# If Key exists start Decrypting.
if(Test-Path $lockerkeys\"$pcname".key){
Write-Host "KEY FOUND! Loading Key.."
$key = Get-Content -Path $lockerkeys\"$pcname".key

# Decrypt Files using PC's Unique Key
Write-Host "Decrypting Files... Please Wait.."
write-host "`n"
Write-Host "DO NOT TURN EXIT PROGRAM OR RISK LOSSING DATA WHILE DECRYPTING!!"
write-host "`n"
Decrypt-File $lockedfiles -Key $key -Suffix ".$extension"
}

exit