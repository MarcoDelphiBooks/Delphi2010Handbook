object Form39: TForm39
  Left = 0
  Top = 0
  Caption = 'StopWatchTest'
  ClientHeight = 292
  ClientWidth = 554
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
    Left = 176
    Top = 24
    Width = 337
    Height = 249
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnTest: TButton
    Left = 32
    Top = 24
    Width = 97
    Height = 25
    Caption = 'btnTest'
    TabOrder = 1
    OnClick = btnTestClick
  end
  object btnCondensed: TButton
    Left = 32
    Top = 72
    Width = 97
    Height = 25
    Caption = 'btnCondensed'
    TabOrder = 2
    OnClick = btnCondensedClick
  end
end
