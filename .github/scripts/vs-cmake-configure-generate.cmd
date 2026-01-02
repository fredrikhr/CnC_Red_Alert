@ECHO OFF
IF "%VISUAL_STUDIO_INSTALLATION_PATH%"=="" CALL "%~dp0detect-visual-studio.cmd"
CALL "%VISUAL_STUDIO_INSTALLATION_PATH%\Common7\Tools\VsDevCmd.bat" -arch=x86

cmake -S "%~dp0..\.." -B "%~dp0..\..\BLD\Ninja" -G "Ninja Multi-Config" --fresh
