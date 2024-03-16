@echo off

:: Set variables
set ENV_FILE=environment.yml
set ENV_NAME=formatting-automation

:: Delete environment (if it exists)
call conda deactivate
call conda remove --name %ENV_NAME% --all

:: Create environment from yml
call conda env create -f %ENV_FILE%

:: Set up pre-commit hooks
call activate %ENV_NAME%
echo.
call pre-commit install
echo.
call pre-commit autoupdate
echo.
call pre-commit run --all-files
call conda deactivate
