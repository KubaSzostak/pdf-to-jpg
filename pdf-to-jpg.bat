echo off
echo.
echo.

set DPI=300
set ALPHABITS=2
set QUALITY=80
set FIRSTPAGE=1
set LASTPAGE=9999
REM MEMORY in MB
set MEMORY=300

cd /D %~dp1

set PDFFILE=%~nx1
set JPGFILE=%PDFFILE:.pdf=-%%%d.jpg

set GS=%2
IF "%GS%" == "" (
	set GS=bin\gswin32c.exe
)

echo Loading %GS%...
echo.

"%~dp0%GS%" -sDEVICE=jpeg -sOutputFile=%JPGFILE% -r%DPI% -dNOPAUSE -dFirstPage=%FIRSTPAGE% -dLastPage=%LASTPAGE% -dJPEGQ=%QUALITY% -dGraphicsAlphaBits=%ALPHABITS%  -dTextAlphaBits=%ALPHABITS%  -dNumRenderingThreads=4 -dBufferSpace=%MEMORY%000000  -dBandBufferSpace=%MEMORY%000000 -c %MEMORY%000000 setvmthreshold -f %PDFFILE% -c quit

echo Finished.
pause
