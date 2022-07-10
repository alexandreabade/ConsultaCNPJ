object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 452
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object ecnpj: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 135
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 967
    Height = 388
    Align = alBottom
    DataSource = DS_Pessoa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_razao'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apelido_fantasia'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fone1'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco_numero'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cep'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ibge'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rg_insc'
        Width = 109
        Visible = True
      end>
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 220
    Top = 9
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 252
    Top = 9
  end
  object CDS_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 8
    object CDS_Pessoanome_razao: TStringField
      FieldName = 'nome_razao'
      Size = 200
    end
    object CDS_Pessoafone1: TStringField
      FieldName = 'fone1'
    end
    object CDS_Pessoabairro: TStringField
      FieldName = 'bairro'
    end
    object CDS_Pessoaendereco: TStringField
      FieldName = 'endereco'
      Size = 200
    end
    object CDS_Pessoaendereco_numero: TStringField
      FieldName = 'endereco_numero'
    end
    object CDS_Pessoacep: TStringField
      FieldName = 'cep'
    end
    object CDS_Pessoaapelido_fantasia: TStringField
      FieldName = 'apelido_fantasia'
      Size = 200
    end
    object CDS_Pessoaibge: TIntegerField
      FieldName = 'ibge'
    end
    object CDS_Pessoacidade: TStringField
      FieldName = 'cidade'
      Size = 200
    end
    object CDS_Pessoaemail: TStringField
      FieldName = 'email'
      Size = 300
    end
    object CDS_Pessoarg_insc: TStringField
      FieldName = 'rg_insc'
      Size = 200
    end
  end
  object DS_Pessoa: TDataSource
    DataSet = CDS_Pessoa
    Left = 352
    Top = 8
  end
end
