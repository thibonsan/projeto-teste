@echo OFF

set ERRO_COMP=
set VERSAO_MAJOR=%1
set VERSAO_MINOR=%2
set VERSAO_RELEASE=%3
set VERSAO_BUILD=%4
set OUTPUT_DIR=%5

call ProjetoTeste.bat %VERSAO_MAJOR% %VERSAO_MINOR% %VERSAO_RELEASE% %VERSAO_BUILD% %OUTPUT_DIR%

if NOT "%ERRO_COMP%"=="" goto Failed

goto end

:Failed
echo O processo será finalizado!
echo.
exit /B 1	

:end
::exit