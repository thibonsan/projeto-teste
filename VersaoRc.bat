@echo OFF
REM INPUT: DIR_PRJ  = O caminho do projeto
REM        PRJ      = O nome do arquivo .dpr do projeto (Ex. VerusRCV)
REM        RES      = O nome do arquivo de recurso que contém informações da versão (Ex. VerusRCV_Versao.rc)
REM        DESC_SIS = A descrição do sistema (Ex. "Registro Civil das Pessoas Naturais")
REM        VERSAO_MAJOR    = Número Major Version
REM        VERSAO_MINOR    = Número Minor Version
REM        VERSAO_RELEASE  = Número Release Version
REM        VERSAO_BUILD    = Número Build Version
REM Example: Compile.bat "..\AnSataSistemas\VerusRCV" VerusRCV.dpr VerusRCV_Versao.rc "C:\AnSata"
set DIR_PRJ=%1
set PRJ=%2
set RES=%3
:: O "~" retira as aspas duplas ("") do parâmetro
set DESC_SIS=%~4
set VERSAO_MAJOR=%~5
set VERSAO_MINOR=%~6
set VERSAO_RELEASE=%~7
set VERSAO_BUILD=%~8

if "VERSAO_MAJOR"=="" set VERSAO_MAJOR=0
if "VERSAO_MINOR"=="" set VERSAO_MINOR=0
if "VERSAO_RELEASE"=="" set VERSAO_RELEASE=0
if "VERSAO_BUILD"=="" set VERSAO_BUILD=0

set COMPANY_NAME=A.S. Sistemas de Informática Ltda
set FILE_DESCRIPTION=%DESC_SIS%
set LEGAL_COPYRIGHT=AnSata Informática Ltda
set COMMENTS=AnSata Informática Ltda.     Rua Duque de Caxias, 767, São Francisco · C.E.P. 80.530-040 · Curitiba - Paraná.  Fone/Fax (041) 3078-2940 e-mail: suporte@ansata.com.br web: www.ansata.com.br

PUSHD %DIR_PRJ%

ECHO 1 VERSIONINFO > %RES%
ECHO FILEVERSION %VERSAO_MAJOR%,%VERSAO_MINOR%,%VERSAO_RELEASE%,%VERSAO_BUILD% >> %RES%
ECHO PRODUCTVERSION %VERSAO_MAJOR%,%VERSAO_MINOR%,%VERSAO_RELEASE%,%VERSAO_BUILD% >> %RES%
ECHO FILEOS VOS__WINDOWS32 >> %RES%
ECHO FILETYPE VFT_APP >> %RES%
ECHO BEGIN >> %RES%
ECHO    BLOCK "StringFileInfo" >> %RES%
ECHO    BEGIN >> %RES%
ECHO       BLOCK "040904E4" >> %RES%
ECHO       BEGIN >> %RES%
ECHO          VALUE "CompanyName", "%COMPANY_NAME%\000" >> %RES%
ECHO          VALUE "FileDescription", "%FILE_DESCRIPTION%\000" >> %RES%
ECHO          VALUE "FileVersion", "%VERSAO_MAJOR%.%VERSAO_MINOR%.%VERSAO_RELEASE%.%VERSAO_BUILD%\000" >> %RES%
ECHO          VALUE "InternalName", "%PRJ%.EXE\000" >> %RES%
ECHO          VALUE "LegalCopyright", "%LEGAL_COPYRIGHT%\000" >> %RES%
ECHO          VALUE "LegalTrademarks", "VERUS\000" >> %RES%
ECHO          VALUE "OriginalFilename", "%PRJ%\000" >> %RES%
ECHO          VALUE "ProductName", "%PRJ%\000" >> %RES%
ECHO          VALUE "ProductVersion", "%VERSAO_MAJOR%\000" >> %RES%
ECHO          VALUE "Comments", "%COMMENTS%\000" >> %RES%
ECHO       END >> %RES%
ECHO    END >> %RES%
ECHO    BLOCK "VarFileInfo" >> %RES%
ECHO    BEGIN >> %RES%
ECHO       VALUE "Translation", 0x0416 0x04E4 >> %RES%
ECHO    END >> %RES%
ECHO END >> %RES%

:end
:: Volta ao diretório que estava quando chamou o VersaoRc.bat
POPD