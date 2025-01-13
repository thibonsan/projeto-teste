program ProjetoTeste;
{$R 'ProjetoTeste_Versao.res' 'ProjetoTeste_Versao.rc'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
