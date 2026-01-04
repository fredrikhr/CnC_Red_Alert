@ECHO OFF
FOR /F "tokens=*" %%V IN ('"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -property installationPath') DO (
    ECHO.::debug::Visual Studio installation path: %%~V
    CALL "%%~V\Common7\Tools\VsDevCmd.bat" -arch=x86
)
