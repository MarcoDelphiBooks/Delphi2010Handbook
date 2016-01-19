object FormRttiIntro: TFormRttiIntro
  Left = 0
  Top = 0
  Caption = 'RttiIntro'
  ClientHeight = 290
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
  object btnInfo: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnInfo'
    TabOrder = 0
    OnClick = btnInfoClick
  end
  object Memo1: TMemo
    Left = 89
    Top = 8
    Width = 448
    Height = 274
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnChange: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'btnChange'
    TabOrder = 2
    OnClick = btnChangeClick
  end
end
