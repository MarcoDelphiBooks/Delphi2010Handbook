object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'GetOSVersion'
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
  object btnGetVersion: TButton
    Left = 32
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Get Version'
    TabOrder = 0
    OnClick = btnGetVersionClick
  end
  object Memo1: TMemo
    Left = 128
    Top = 24
    Width = 305
    Height = 241
    TabOrder = 1
  end
end
