@ECHO OFF
CALL "%~dp0init-visual-studio-devcmd.cmd"

IF "%~1"=="" (
    SET INPUT_BUILD_CONFIG=Release
) ELSE SET INPUT_BUILD_CONFIG=%~1
IF "%~2"=="" (
    SET INPUT_BUILD_TARGET_NAME=all
) ELSE SET INPUT_BUILD_TARGET_NAME=%~2

SET TMP_BUILD_CMD=cmake --build "%~dp0..\..\BLD\Ninja" --config %INPUT_BUILD_CONFIG% --target %INPUT_BUILD_TARGET_NAME%
ECHO.::debug::%TMP_BUILD_CMD%
%TMP_BUILD_CMD%
