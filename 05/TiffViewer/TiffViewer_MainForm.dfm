object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TiffViewer'
  ClientHeight = 310
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    708
    310)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 511
    Height = 294
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitWidth = 489
    ExplicitHeight = 274
  end
  object Button1: TButton
    Left = 625
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'btnOpen'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 503
  end
  object Button2: TButton
    Left = 625
    Top = 39
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'btnRotate'
    TabOrder = 1
    OnClick = Button2Click
    ExplicitLeft = 503
  end
  object Memo1: TMemo
    Left = 536
    Top = 70
    Width = 163
    Height = 232
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 2
    ExplicitLeft = 552
    ExplicitHeight = 226
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'TIFF file (*.tif, *.tiff)|*.tif*|JPEG file (*.jpg)|*.jpg|Any Fil' +
      'e (*.*)|*.*'
    FilterIndex = 0
    Left = 536
    Top = 88
  end
end
