@echo off
mode con:cols=75 lines=28
setlocal EnableDelayedExpansion
IF EXIST "%~dp0\lockerkeys\*.key" GOTO YES
echo By using Private-Locker Software, the User assumes all risks associated 
echo with the use of this Software, including any risk to User's computer, 
echo software or data being damaged by any virus, software, or any other file
echo  which might be transmitted or activated via a Private-Locker Software 
echo or User's access to it. Private-Locker shall not in any event be liable 
echo for any direct, indirect, punitive, special, incidental, or 
echo consequential damages, including, without limitation, lost revenues, or 
echo lost profits, arising out of or in any way connected with the use or 
echo misuse of the information or lack of information on the Private-Locker 
echo Software or with the delay or inability to use this Software, or from 
echo any information, documents, services, software, or other material 
echo obtained through this Software, or otherwise arising out of the use of 
echo this Software, whether based on contract, tort, strict liability or 
echo otherwise, even if Private-Locker and/or any of its employees/affiliates
echo  has been advised of the possibility of damages. Private-Locker shall not
echo be liable for any loss or injury caused in whole, or in part, by its 
echo actions, omissions, or contingencies beyond its control, including in 
echo procuring, compiling, or delivering the information, or arising out of 
echo any errors, omissions, or inaccuracies in the information regardless of 
echo how caused, or arising out of any user's decision, or action taken or not
echo  taken in reliance upon information furnished.
echo.
echo.
:ASK
set INPUT=
set /P INPUT="Do you Agree to these Terms?.. (Y/N or E to Exit)  "
IF /I "%INPUT%"=="y" GOTO YES 
IF /I "%INPUT%"=="n" GOTO NO
IF /I "%INPUT%"=="yes" GOTO YES 
IF /I "%INPUT%"=="no" GOTO NO
IF /I "%INPUT%"=="ye" GOTO YES
IF /I "%INPUT%"=="agree" GOTO YES 
IF /I "%INPUT%"=="disagree" GOTO NO
IF /I "%INPUT%"=="e" GOTO EXIT
IF /I "%INPUT%"=="ex" GOTO EXIT
IF /I "%INPUT%"=="exi" GOTO EXIT
IF /I "%INPUT%"=="exit" GOTO EXIT
IF /I "%INPUT%"=="q" GOTO EXIT
IF /I "%INPUT%"=="qu" GOTO EXIT
IF /I "%INPUT%"=="qui" GOTO EXIT
IF /I "%INPUT%"=="quit" GOTO EXIT
echo You MUST Agree to the Terms to use this tool!
timeout /t 2 /NOBREAK >NUL
GOTO ASK
:YES
call "%~dp0\programcore.cmd"
exit /b

:NO
echo You MUST Agree to the Terms to use this tool!
timeout /t 2 /NOBREAK >NUL
GOTO ASK
exit /b

:EXIT
echo Thank you for using this Tool!
timeout /t 2 /NOBREAK >NUL
exit /b