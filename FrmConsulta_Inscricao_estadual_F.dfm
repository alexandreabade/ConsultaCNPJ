object FrmConsulta_Inscricao_estadual: TFrmConsulta_Inscricao_estadual
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Selecione a Incricao Estadual'
  ClientHeight = 180
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 465
    Height = 180
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'inscricao'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Width = 147
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = CDS_INSCRICOES
    Left = 248
    Top = 96
  end
  object CDS_INSCRICOES: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 96
    object CDS_INSCRICOESinscricao: TStringField
      FieldName = 'inscricao'
      Size = 40
    end
    object CDS_INSCRICOESativo: TStringField
      FieldName = 'ativo'
    end
    object CDS_INSCRICOESestado: TStringField
      FieldName = 'estado'
      Size = 100
    end
  end
end
