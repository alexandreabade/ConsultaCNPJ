program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  consultacnpjjson in 'consultacnpjjson.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  FrmConsulta_Inscricao_estadual_F in 'FrmConsulta_Inscricao_estadual_F.pas' {FrmConsulta_Inscricao_estadual};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmConsulta_Inscricao_estadual, FrmConsulta_Inscricao_estadual);
  Application.Run;
end.
