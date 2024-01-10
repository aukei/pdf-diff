@echo off

set infile1=%1
set infile2=%2
set outfile=%3
IF "%4" == "RUN" GOTO EXEC


IF EXIST "%infile1%" (
  echo %infile1% exists - ok
) ELSE (
  echo %infile1% not found.
  EXIT /B 1
)

IF EXIST "%infile2%" (
  echo %infile2% exists - ok
) ELSE (
  echo %infile2% not found.
  EXIT /B 2
)

IF EXIST "%outfile%" (
  echo %outfile% already exists
  EXIT /B 3
) ELSE (
  echo %outfile% not found - ok
)

CALL conda run -n pdfdiff %0 %1 %2 %3 RUN
GOTO END

:EXEC
(pdf-diff -s strike,highlight %infile1% %infile2%) > %outfile%
GOTO END

:END
echo Normal End