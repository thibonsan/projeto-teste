@echo OFF
set DESC_SIS="Projeto Teste"
set DIR_PRJ=".\Sistemas\ProjetoTeste"
set PRJ=ProjetoTeste
set RES=ProjetoTeste_Versao.rc
set DIR_OUTPUTDCU="C:\Temp"
set VERSAO_MAJOR=%1
set VERSAO_MINOR=%2
set VERSAO_RELEASE=%3
set VERSAO_BUILD=%4
set OUTPUT_DIR=%5

:: Configura um diretório de output das dcu para cada versão.
if not "%VERSAO_MAJOR%"=="" set DIR_OUTPUTDCU=C:\Temp\%VERSAO_MAJOR%%VERSAO_MINOR%%VERSAO_RELEASE%

:: Se passou a versão, atualiza o arquivo de recurso (.RC) com as informações da versão
if NOT "%VERSAO_MAJOR%"=="" call VersaoRc.bat %DIR_PRJ% %PRJ% %RES% %DESC_SIS% %VERSAO_MAJOR% %VERSAO_MINOR% %VERSAO_RELEASE% %VERSAO_BUILD%

call Compile.bat %DIR_PRJ% %PRJ% %RES% %OUTPUT_DIR% %DIR_OUTPUTDCU%
