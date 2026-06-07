@echo off
setlocal
cd /d "%~dp0"

echo ========================================================
echo  Bluetamp Cafe - push to GitHub
echo  Target: https://github.com/kirbykung168-art/Bluetamp-cafe
echo ========================================================
echo.

if exist ".git\HEAD" (
  echo [0/7] Existing .git found - keeping history.
) else (
  if exist ".git" rmdir /s /q ".git"
  echo [0/7] No .git - initializing fresh.
  git init -b main
)

echo [1/7] Verifying main branch...
echo.

for /f "tokens=*" %%i in ('git config --global user.email 2^>nul') do set GIT_EMAIL=%%i
if "%GIT_EMAIL%"=="" (
  echo Setting git identity...
  git config --global user.email "kirbykung168@gmail.com"
  git config --global user.name "Kirby"
)

echo [2/7] Trying gh repo create (skip if gh not installed)...
where gh >nul 2>&1
if not errorlevel 1 (
  gh repo create kirbykung168-art/Bluetamp-cafe --public --source=. --remote=origin 2>nul
  if errorlevel 1 echo gh repo create failed - the repo may already exist or you may not be signed in.
)

echo [3/7] Configuring remote...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/kirbykung168-art/Bluetamp-cafe.git
git remote -v
echo.

echo [3.5/7] Untracking original full-size images from git...
git rm --cached --ignore-unmatch "images/*.jpg" "images/*.jpeg" "images/*.png" >nul 2>&1

echo [4/7] Staging files...
git add .
echo.
echo [5/7] Committing...
git commit -m "Add press wall with verified citations and championship credentials" 2>nul
if errorlevel 1 echo Nothing new to commit, or already committed.
echo.

git branch -M main 2>nul

echo [6/7] Pushing to GitHub...
echo (if a browser pops up asking you to sign in to GitHub, please approve)
git push -u origin main
if errorlevel 1 (
  echo.
  echo Push rejected. Pulling remote first then retrying...
  git pull origin main --allow-unrelated-histories --no-edit
  echo.
  echo [7/7] Retrying push...
  git push -u origin main
)

echo.
echo ========================================================
echo  Done. Check https://github.com/kirbykung168-art/Bluetamp-cafe
echo ========================================================
echo.
echo NOTE: If the push fails with 'Repository not found', create the
echo empty repo here first: https://github.com/new
echo  - Owner: kirbykung168-art
echo  - Repo name: Bluetamp-cafe
echo  - Public, no README/license
echo Then rerun this script.
echo.
pause
endlocal
