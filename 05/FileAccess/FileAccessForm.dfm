object FormFile: TFormFile
  Left = 0
  Top = 0
  Caption = 'FileAccess'
  ClientHeight = 303
  ClientWidth = 567
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
  object Memo1: TMemo
    Left = 24
    Top = 16
    Width = 425
    Height = 265
    Lines.Strings = (
      'Some text here.')
    TabOrder = 0
  end
  object btnSaveRoot: TButton
    Left = 456
    Top = 16
    Width = 100
    Height = 25
    Caption = 'Save Root'
    TabOrder = 1
    OnClick = btnSaveRootClick
  end
  object btnSaveLocal: TButton
    Left = 456
    Top = 56
    Width = 100
    Height = 25
    Caption = 'Save Local'
    TabOrder = 2
    OnClick = btnSaveLocalClick
  end
  object btnLoadLocal: TButton
    Left = 456
    Top = 96
    Width = 100
    Height = 25
    Caption = 'Load Local'
    TabOrder = 3
    OnClick = btnLoadLocalClick
  end
  object btnSaveDocs: TButton
    Left = 455
    Top = 136
    Width = 101
    Height = 25
    Caption = 'Save Docs'
    TabOrder = 4
    OnClick = btnSaveDocsClick
  end
  object btnLoadDocs: TButton
    Left = 455
    Top = 176
    Width = 101
    Height = 25
    Caption = 'Load Docs'
    TabOrder = 5
    OnClick = btnLoadDocsClick
  end
  object btnUAC: TButton
    Left = 456
    Top = 256
    Width = 100
    Height = 25
    Caption = 'Copy (UAC)'
    TabOrder = 6
    OnClick = btnUACClick
  end
end
