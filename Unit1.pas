unit Unit1;
{Projeto Feito por ALexandre Como exemplo para consulta de cnpj
com Inscricao Estadual}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,wininet, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,midaslib;

type
  TForm1 = class(TForm)
    ecnpj: TEdit;
    Label1: TLabel;
    Button1: TButton;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP1: TIdHTTP;
    CDS_Pessoa: TClientDataSet;
    DBGrid1: TDBGrid;
    DS_Pessoa: TDataSource;
    CDS_Pessoanome_razao: TStringField;
    CDS_Pessoafone1: TStringField;
    CDS_Pessoabairro: TStringField;
    CDS_Pessoaendereco: TStringField;
    CDS_Pessoaendereco_numero: TStringField;
    CDS_Pessoacep: TStringField;
    CDS_Pessoaapelido_fantasia: TStringField;
    CDS_Pessoaibge: TIntegerField;
    CDS_Pessoacidade: TStringField;
    CDS_Pessoaemail: TStringField;
    CDS_Pessoarg_insc: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function iif(bcondicao:boolean;vtrue,vfalse:variant):variant;
    function ConectadoInternet():boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses consultacnpjjson, FrmConsulta_Inscricao_estadual_F;

procedure TForm1.Button1Click(Sender: TObject);
var
 url,Retorno:string;
 JsonStreamRetorno : TStringStream;
 JsonConsultaCNPJ:TRoot;
 I:integer;

begin
  if ConectadoInternet then
  begin
    if Length(ecnpj.Text)=14 then
    begin
      CDS_Pessoa.Close;
      CDS_Pessoa.CreateDataSet;
      CDS_Pessoa.Open;
      CDS_Pessoa.Insert;
      url:='https://publica.cnpj.ws/cnpj/'+ecnpj.Text;
      JsonStreamRetorno := TStringStream.Create('');
      idHttp1.Response.ContentType := 'application/json';
      idHttp1.Response.CharSet := 'UTF-8';
      try
        idHttp1.Get(URL,JsonStreamRetorno);
      except on E:EIdHTTPProtocolException do
      begin
        ShowMessage(e.ErrorMessage);
        abort;
      end;
      end;
      retorno:=JsonStreamRetorno.DataString;
      JsonConsultaCNPJ := TRoot.FromJsonString(retorno);

      cds_pessoanome_razao.AsString      := JsonConsultaCNPJ.RazaoSocial;
      cds_pessoafone1.AsString           := JsonConsultaCNPJ.Estabelecimento.Ddd1+JsonConsultaCNPJ.Estabelecimento.Telefone1;
      cds_pessoabairro.AsString          := JsonConsultaCNPJ.Estabelecimento.Bairro;
      cds_pessoaendereco.AsString        := JsonConsultaCNPJ.Estabelecimento.Logradouro;
      cds_pessoaendereco_numero.AsString := JsonConsultaCNPJ.Estabelecimento.Numero;
      cds_pessoacep.AsString             := JsonConsultaCNPJ.Estabelecimento.Cep;
      CDS_Pessoacidade.AsString          :=JsonConsultaCNPJ.Estabelecimento.Cidade.Nome;
      CDS_Pessoaibge.AsInteger           :=JsonConsultaCNPJ.Estabelecimento.Cidade.IbgeId;
      cds_pessoaapelido_fantasia.AsString := JsonConsultaCNPJ.Estabelecimento.NomeFantasia;
      cds_pessoaemail.AsString      := JsonConsultaCNPJ.Estabelecimento.Email ;
      if (JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais<>nil) then
      begin
         if JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais.Count>0 then
         begin
            try
             FrmConsulta_Inscricao_estadual := TFrmConsulta_Inscricao_estadual.Create(nil);
             for I := 0 to JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais.Count-1 do
             begin
               FrmConsulta_Inscricao_estadual.CDS_INSCRICOES.InsertRecord([
               JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais[i].InscricaoEstadual,
               iif(JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais[i].Ativo,'ATIVO','INATIVO'),
               JsonConsultaCNPJ.Estabelecimento.InscricoesEstaduais[I].Estado.Nome]);
             end;
             FrmConsulta_Inscricao_estadual.ShowModal;
             cds_pessoarg_insc.AsString      := FrmConsulta_Inscricao_estadual.CDS_INSCRICOESinscricao.AsString;
           finally
             FreeAndNil(FrmConsulta_Inscricao_estadual);
           end;
         end else
         begin
           cds_pessoarg_insc.AsString      := 'ISENTO';
         end;
      end else
      cds_pessoarg_insc.AsString      := 'ISENTO';
      FreeAndNil(JsonConsultaCNPJ);
    end else
    begin
      raise Exception.Create('CNPJ INVALIDO');
    end;
  end;
end;

function TForm1.ConectadoInternet: boolean;
var estado : Dword;
begin
  if not InternetGetConnectedState(@estado, 0) then
    result := False
  else
  begin
  if (estado and INTERNET_CONNECTION_LAN <> 0) OR (estado and INTERNET_CONNECTION_MODEM <> 0) or (Estado and INTERNET_CONNECTION_PROXY <> 0) then
    result  := True;
  end;
end;

function TForm1.iif(bcondicao:boolean;vtrue,vfalse:variant):variant;
begin
 if bcondicao then
 result := vtrue else result :=vfalse;
end;

end.
