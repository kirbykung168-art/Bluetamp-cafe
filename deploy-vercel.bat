@echo off
setlocal
cd /d "%~dp0"

echo ========================================================
echo  Bluetamp Cafe - deploy to Vercel
echo ========================================================
echo.

echo Deploying production build via npx vercel@latest...
echo (if a browser pops up asking you to sign in to Vercel, please approve)
echo Output redirected to deploy.log so I can read progress from outside.
call npx --yes vercel@latest --prod --yes > deploy.log 2>&1
type deploy.log

echo.
echo ========================================================
echo  Done. The URL print