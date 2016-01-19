object FormJsonClient: TFormJsonClient
  Left = 0
  Top = 0
  Caption = 'DsnapJsonClient'
  ClientHeight = 325
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnValue: TButton
    Left = 24
    Top = 22
    Width = 113
    Height = 25
    Caption = 'btnValue'
    TabOrder = 0
    OnClick = btnValueClick
  end
  object btnArray: TButton
    Left = 24
    Top = 64
    Width = 113
    Height = 25
    Caption = 'btnArray'
    TabOrder = 1
    OnClick = btnArrayClick
  end
  object btnMarshal: TButton
    Left = 24
    Top = 112
    Width = 113
    Height = 25
    Caption = 'btnMarshal'
    TabOrder = 2
    OnClick = btnMarshalClick
  end
  object Memo1: TMemo
    Left = 160
    Top = 24
    Width = 417
    Height = 281
    TabOrder = 3
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Left = 32
    Top = 192
  end
end
