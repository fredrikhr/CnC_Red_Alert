@ECHO OFF
CALL "%~dp0init-visual-studio-devcmd.cmd"

cmake -S "%~dp0..\.." -B "%~dp0..\..\BLD\Ninja" -G "Ninja Multi-Config" --fresh
