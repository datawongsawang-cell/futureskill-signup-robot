@echo off
rem Usage: run_tests.bat 08xxxxxxxx [email_user]
rem   08xxxxxxxx  your own mobile number (the OTP SMS is sent to this number)
rem   email_user  optional, the part before the @; a +timestamp alias is added each run
chcp 65001 >nul
cd /d "%~dp0"
if "%~1"=="" (
  echo Please give your phone number, e.g.  run_tests.bat 0812345678
  exit /b 1
)
python -m pip install -q -r requirements.txt
set EXTRA=
if not "%~2"=="" set EXTRA=-v email_user:%~2
python -m robot -d results -v phone:%~1 %EXTRA% testcases
start "" results\report.html
