@ECHO OFF
GOTO :Main

:Main
FOR /R "%~dp0.." %%B IN (*.BAK) DO (
    IF EXIST "%%~dpnB" (
        CALL :HandleFile "%%B" "%%~dpnB"
    ) ELSE (
        IF EXIST "%%~dpnB.TXT" (
            CALL :HandleFile "%%B" "%%~dpnB.TXT"
        ) ELSE IF EXIST "%%~dpnB.BAT" (
            CALL :HandleFile "%%B" "%%~dpnB.BAT"
        ) ELSE IF EXIST "%%~dpnB.MAK" (
            CALL :HandleFile "%%B" "%%~dpnB.MAK"
        ) ELSE IF EXIST "%%~dpnB.ASM" (
            CALL :HandleFile "%%B" "%%~dpnB.ASM"
        ) ELSE IF EXIST "%%~dpnB.C" (
            CALL :HandleFile "%%B" "%%~dpnB.C"
        ) ELSE IF EXIST "%%~dpnB.CPP" (
            CALL :HandleFile "%%B" "%%~dpnB.CPP"
        ) ELSE IF EXIST "%%~dpnB.I" (
            CALL :HandleFile "%%B" "%%~dpnB.I"
        ) ELSE IF EXIST "%%~dpnB.H" (
            CALL :HandleFile "%%B" "%%~dpnB.H"
        ) ELSE (
            ECHO Removing %%B that has no accompanied original file.
        )
    )
)
EXIT /B

:HandleFile
ECHO.%~1 related to %~nx2 in %~dp1
START "%~1" "%ComSpec%" /C "gvimdiff "%~2" "%~1""
ECHO.git rm command for %~nx1 placed in clipboard
ECHO.git rm "%~1"| CLIP
PAUSE
EXIT /B
