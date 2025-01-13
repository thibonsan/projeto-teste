@echo OFF
REM INPUT: DIR_PRJ = O caminho do projeto
REM        PRJ     = O nome do arquivo .dpr do projeto (Ex. VerusRCV)
REM        RES     = O nome do arquivo de recurso que contém informações da versão (Ex. VerusRCV_Versao.rc)
REM        OUTPUT_DIR = O caminho onde será gerado o executável
REM Example: Compile.bat "..\AnSataSistemas\VerusRCV" VerusRCV.dpr VerusRCV_Versao.rc "C:\AnSata"
REM Configura as variáveis de ambiente
set DIR_DELPHI=C:\Progra~2\Borland\Delphi7\
set COMP_MSGS=-UNIT_PLATFORM
set SEARCH_PATH="%DIR_DELPHI%\lib";"%DIR_DELPHI%\lib\Obj";"%DIR_DELPHI%\Imports";"%DIR_DELPHI%\Bin";"%DIR_DELPHI%\Projects\Bpl";"%DIR_DELPHI%\Rave5\lib"
set DIR_COMPONEN7=C:\Componen7
set DIR_OUTPUTDCU=C:\Temp

set SEARCH_PATH_COMP1="C:\Verus\trunk\AnSataSistemas\Conexao";"%DIR_COMPONEN7%\Woll2Woll\ip4000vcl7\source";"%DIR_COMPONEN7%\Woll2Woll\ip4000vcl7\LIB";"%DIR_COMPONEN7%\Addict3\Source\d7";"%DIR_COMPONEN7%\Addict3\wpTools";"%DIR_COMPONEN7%\AnSata Componentes";"%DIR_COMPONEN7%\barcode";"%DIR_COMPONEN7%\ComDRV32";"%DIR_COMPONEN7%\cooltray";"%DIR_COMPONEN7%\dbisam\infopowr";"%DIR_COMPONEN7%\dbisam\Version 4\Delphi 7\code";"%DIR_COMPONEN7%\JLCVIDEO";"%DIR_COMPONEN7%\Labels\drlabel";"%DIR_COMPONEN7%\Labels\filelbl";"%DIR_COMPONEN7%\Labels\lbleffct";"%DIR_COMPONEN7%\OKeyDeveloperKitv1.1.3";"%DIR_COMPONEN7%\pngimage";"%DIR_COMPONEN7%\pngimage\pngcomponents\source";"%DIR_COMPONEN7%\rtBarCode\control";"%DIR_COMPONEN7%\Suite46D7";"%DIR_COMPONEN7%\tb2k-2.2.0\Source";"%DIR_COMPONEN7%\tb97_180\Source";"%DIR_COMPONEN7%\TRAYICON";"%DIR_COMPONEN7%\VclZip7";"%DIR_COMPONEN7%\Woll2Woll\ip4000vcl7\source";"%DIR_COMPONEN7%\wPDF\D7";"%DIR_COMPONEN7%\WPTools\D7";"%DIR_COMPONEN7%\xbase"
set SEARCH_PATH_COMP2="%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src";"%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src\component";"%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src\core";"%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src\dbc";"%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src\parsesql";"%DIR_COMPONEN7%\ZEOSDBO-6.6.5\src\plain";"%DIR_COMPONEN7%\ZipMaster";"%DIR_COMPONEN7%\Jedi\jcl\lib\d7";"%DIR_COMPONEN7%\Jedi\jcl\source";"%DIR_COMPONEN7%\Jedi\jvcl\lib\D7";"%DIR_COMPONEN7%\Jedi\jvcl\common";"%DIR_COMPONEN7%\Jedi\jvcl\Resources"
set SEARCH_PATH_COMP3="%DIR_COMPONEN7%\MsnPopup";"%DIR_COMPONEN7%\FreeBoleto";"%DIR_COMPONEN7%\WPViewPDF\VCL";"%DIR_COMPONEN7%\DelphiTif";"%DIR_COMPONEN7%\Apprehend";"%DIR_COMPONEN7%\Acbr\Fontes\ACBrComum";"%DIR_COMPONEN7%\Acbr\Fontes\ACBrBoleto";"%DIR_COMPONEN7%\Acbr\Lib\Delphi\LibD7";"%DIR_COMPONEN7%\FortesReport"
set SEARCH_PATH_COMP4="C:\Temp"
set SEARCH_PATH_COMP=%SEARCH_PATH_COMP1%;%SEARCH_PATH_COMP2%;%SEARCH_PATH_COMP3%;%SEARCH_PATH_COMP4%


set RES_PATH="%DIR_COMPONEN7%\JEDI\JVCL\Resources"

REM O path do delphi fica com a pasta bin
set DIR_DELPHI=%DIR_DELPHI%\bin

set DIR_PRJ=%1
set PRJ=%2
set RES=%3
set OUTPUT_DIR=%4

if NOT "%5"=="" set DIR_OUTPUTDCU=%5

if NOT "%DIR_OUTPUTDCU%"=="" (
   if NOT EXIST "%DIR_OUTPUTDCU%" (mkdir %DIR_OUTPUTDCU%)
)

if "%DIR_DELPHI%"=="" goto DelphiNotFound

REM cd /d %DIR_PRJ%
PUSHD %DIR_PRJ%

:: compilando o arquivo de recurso com os dados da versao
"%DIR_DELPHI%\brcc32.exe" %RES%

echo. 
echo [Compilando sistema! %PRJ%]	
echo. 

:: compila efetivamente o programa
:: "%DIR_DELPHI%\dcc32.exe" -U%SEARCH_PATH%;%SEARCH_PATH_COMP1%;%SEARCH_PATH_COMP2%;%SEARCH_PATH_COMP3% -R%RES_PATH% -B -Q -H- -W%COMP_MSGS% -E%OUTPUT_DIR% %PRJ%.dpr
:: O parâmetro -I especifica o diretório para procurar arquivos utilizados na diretiva {$I VERUSINC.INC}
:: O diretório "Include" existe no VerusCep
"%DIR_DELPHI%\dcc32.exe" -U%SEARCH_PATH%;%SEARCH_PATH_COMP% -I"Include" -R%RES_PATH% -B -Q -H- -W%COMP_MSGS% -N%DIR_OUTPUTDCU% -E%OUTPUT_DIR% %PRJ%.dpr

if ERRORLEVEL 1 goto Failed

echo. 
echo [Concluido! %PRJ%]	
echo. 
goto end

:DelphiNotFound
echo. 
set ERRO_COMP=Não foi encontrada a instalação do Delphi7!
echo Erro: Não foi encontrada a instalação do Delphi7!
echo. 
goto end

:Failed
echo. 
set ERRO_COMP=Houve falha na compilacao do sistema %PRJ%
echo Houve falha na compilacao do sistema %PRJ%
echo. 
goto end

:end
:: Volta ao diretório que estava quando chamou o compile.bat
POPD
:: exit