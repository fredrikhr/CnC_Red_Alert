@ECHO OFF
IF "%GITHUB_OUTPUT%"=="" (
    SET GITHUB_OUTPUT=%~dp0.\%~n0.github-output.txt
    COPY /Y NUL "%GITHUB_OUTPUT%" 1> NUL
)
FOR /F "tokens=*" %%V IN ('"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -property installationPath') DO (
    SET VISUAL_STUDIO_INSTALLATION_PATH=%%~V
    ECHO.::debug::VISUAL_STUDIO_INSTALLATION_PATH=%VISUAL_STUDIO_INSTALLATION_PATH%
    ECHO.visual-studio-installationpath=%%~V>> %GITHUB_OUTPUT%
)
