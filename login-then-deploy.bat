@echo off
setlocal
cd /d "%~dp0"

echo ========================================================
echo  Bluetamp Cafe - LOGIN to Vercel, then DEPLOY
echo ========================================================
echo.
echo  Step 1) When prompted for an email, type yours and Enter.
echo  Step 2) Check email for the Vercel verification link, click it.
echo  Step 3) Return here - the deploy will continue automatically.
echo.
pause

call npx --yes vercel@latest login
if errorlevel 1 (
  echo Login failed. Aborting.
  pause
  exit /b 1
)

echo.
echo ========================================================
echo  Login succeeded. Starting production deploy...
echo ========================================================
call npx --yes vercel@latest --prod --yes

echo.
echo ========================================================
echo  Done. The URL printed above is your live site.
echo ========================================================
pause
endlocal
