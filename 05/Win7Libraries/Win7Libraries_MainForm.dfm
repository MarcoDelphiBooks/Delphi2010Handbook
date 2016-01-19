object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Win7Libraries'
  ClientHeight = 315
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    657
    315)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpenClassic: TButton
    Left = 24
    Top = 24
    Width = 145
    Height = 25
    Caption = 'btnOpenClassic'
    TabOrder = 0
    OnClick = btnOpenClassicClick
  end
  object btnOpenNew: TButton
    Left = 24
    Top = 56
    Width = 145
    Height = 25
    Caption = 'btnOpenNew'
    TabOrder = 1
    OnClick = btnOpenNewClick
  end
  object btnLibraries: TButton
    Left = 24
    Top = 120
    Width = 145
    Height = 25
    Caption = 'btnLibraries'
    TabOrder = 2
    OnClick = btnLibrariesClick
  end
  object Memo1: TMemo
    Left = 192
    Top = 24
    Width = 448
    Height = 266
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    ExplicitWidth = 345
    ExplicitHeight = 241
  end
  object btnLibraryXml: TButton
    Left = 24
    Top = 160
    Width = 145
    Height = 25
    Caption = 'btnLibraryXml'
    TabOrder = 4
    OnClick = btnLibraryXmlClick
  end
  object OpenDialog1: TOpenDialog
    Left = 232
    Top = 16
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 320
    Top = 48
  end
end
