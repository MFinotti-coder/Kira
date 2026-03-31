@echo off
color 0A
title KIRA - Central

cd /d C:\Marilia\kira-control-center

:: =========================
:: INICIO AUTOMATICO
:: =========================
cls
echo =====================================
echo           KIRA - INICIO DO DIA
echo =====================================
echo.
echo >> Abrindo checklist...
timeout /t 1 >nul
start notepad templates\inicio_dia.txt

echo.
echo Pressione qualquer tecla para abrir o painel...
pause >nul

:: =========================
:: PAINEL
:: =========================
:menu
cls
echo =====================================
echo        KIRA - PAINEL DE CONTROLE
echo =====================================
echo.
echo [1] Estado Atual
echo [2] Controle de Bordo
echo [3] Backlog
echo [4] Prompt Base
echo [5] Captura Rapida
echo [6] Pausa Almoco
echo [7] Fim do Dia
echo [8] Resumo Kira
echo [9] Historico do Dia
echo.
echo [0] Sair
echo.
set /p opcao=Escolha uma opcao:

if "%opcao%"=="1" start notepad templates\estado_atual.txt & goto menu
if "%opcao%"=="2" start notepad templates\controle_bordo.txt & goto menu
if "%opcao%"=="3" start notepad templates\backlog.txt & goto menu
if "%opcao%"=="4" start notepad prompt\prompt-base.md & goto menu
if "%opcao%"=="5" start notepad templates\captura_rapida.txt & goto menu
if "%opcao%"=="6" start notepad templates\pausa_almoco.txt & goto menu
if "%opcao%"=="7" start notepad templates\fim_dia.txt & goto menu
if "%opcao%"=="8" start notepad templates\resumo_kira.txt & goto menu

:: gerar data dinamica pro historico
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set HOJE=%%i

if "%opcao%"=="9" start notepad historico\%HOJE%.txt & goto menu

if "%opcao%"=="0" exit

goto menu