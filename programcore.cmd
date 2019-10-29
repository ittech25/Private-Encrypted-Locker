@echo off
dpath=%~dp0
mode con:cols=80 lines=30
set count=1
for /f "tokens=*" %%a in (settings.db) do (
if !count! == 2 (set "extension=%%a" & GOTO :CONTIN )
set /a count+=1
)
:CONTIN
if NOT EXIST "%UserProfile%\Desktop\Locker\" GOTO SETUP
if EXIST "%UserProfile%\Desktop\Locker\*.%extension%" GOTO CHECKKEY
if NOT EXIST "%UserProfile%\Desktop\Locker\*.%extension%" GOTO LOCK
:LOCK
mkdir "%UserProfile%\Desktop\Locker" >NUL 2>NUL
>nul 2>nul dir /a-d "%UserProfile%\Desktop\Locker\*" && (powershell.exe -executionpolicy bypass "%~dp0\lock.ps1") && (attrib +s +h %UserProfile%\Desktop\Locker) || (echo No files found in Locker..)
echo.
echo Encryption Process... DONE
echo.
echo.
echo Press Any key to Close Window..
pause >NUL
exit /B
:CHECKKEY
REM Changed for BashBunny Integration
if NOT EXIST "%~dp0\lockerkeys" GOTO LOCK
if EXIST "%~dp0\lockerkeys\%COMPUTERNAME%.key" GOTO UNLOCK
exit /B
:UNLOCK
powershell.exe -executionpolicy bypass "%~dp0\unlock.ps1"
attrib -s -h "%UserProfile%\Desktop\Locker" >NUL
echo Decryption Process... DONE
echo.
echo.
echo Press Any key to Close Window..
pause >NUL
exit /B
:SETUP
@echo off
mkdir "%UserProfile%\Desktop\Locker" >NUL
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Please Store all Personal files in %UserProfile%\Desktop\Locker and
echo re-run this Program again.
echo.
echo -Development Team
echo.
echo.
echo. Press Any key to Close the Window...
pause >NUL
exit /B