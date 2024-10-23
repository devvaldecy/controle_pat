@echo off
SET THEFILE=C:\Users\AUDIO\Documents\github\Patrimonio.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o C:\Users\AUDIO\Documents\github\Patrimonio.exe C:\Users\AUDIO\Documents\github\link11924.res
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.2.2\bin\i386-win32\postw32.exe --subsystem gui --input C:\Users\AUDIO\Documents\github\Patrimonio.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
