unit FrmConsulta_Inscricao_estadual_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmConsulta_Inscricao_estadual = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CDS_INSCRICOES: TClientDataSet;
    CDS_INSCRICOESinscricao: TStringField;
    CDS_INSCRICOESativo: TStringField;
    CDS_INSCRICOESestado: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Inscricao_estadual: TFrmConsulta_Inscricao_estadual;

implementation

{$R *.dfm}

procedure TFrmConsulta_Inscricao_estadual.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then  close;

end;

procedure TFrmConsulta_Inscricao_estadual.FormCreate(Sender: TObject);
begin
  CDS_INSCRICOES.Close;
  CDS_INSCRICOES.CreateDataSet;
end;

end.
