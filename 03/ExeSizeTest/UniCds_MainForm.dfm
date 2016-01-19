object FormUniCds: TFormUniCds
  Left = 0
  Top = 0
  Caption = 'UniCds'
  ClientHeight = 401
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 144
    Top = 24
    Width = 505
    Height = 369
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object btnPopulate: TButton
    Left = 25
    Top = 24
    Width = 98
    Height = 25
    Caption = 'btnPopulate'
    TabOrder = 1
    OnClick = btnPopulateClick
  end
  object btnFieldNames: TButton
    Left = 24
    Top = 64
    Width = 98
    Height = 25
    Caption = 'btnFieldNames'
    TabOrder = 2
    OnClick = btnFieldNamesClick
  end
  object btnBookmark: TButton
    Left = 25
    Top = 104
    Width = 97
    Height = 25
    Caption = 'btnBookmark'
    TabOrder = 3
    OnClick = btnBookmarkClick
  end
  object btnFieldClass: TButton
    Left = 24
    Top = 144
    Width = 98
    Height = 25
    Caption = 'btnFieldClass'
    TabOrder = 4
    OnClick = btnFieldClassClick
  end
  object btnFieldValue: TButton
    Left = 24
    Top = 184
    Width = 98
    Height = 25
    Caption = 'btnFieldValue'
    TabOrder = 5
    OnClick = btnFieldValueClick
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 192
    Top = 296
  end
end
