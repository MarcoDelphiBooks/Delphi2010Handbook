object Form39: TForm39
  Left = 0
  Top = 0
  Caption = 'DebugVisual'
  ClientHeight = 292
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 64
    Top = 48
    Width = 137
    Height = 25
    Caption = 'btnDateTime'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 64
    Top = 88
    Width = 137
    Height = 25
    Caption = 'btnStringList'
    TabOrder = 1
    OnClick = Button2Click
  end
  object btnUcs4Char: TButton
    Left = 64
    Top = 128
    Width = 137
    Height = 25
    Caption = 'btnUcs4Char'
    TabOrder = 2
    OnClick = btnUcs4CharClick
  end
end
