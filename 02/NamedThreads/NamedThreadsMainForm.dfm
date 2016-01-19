object FormNamedThreads: TFormNamedThreads
  Left = 0
  Top = 0
  Caption = 'NamedThreads'
  ClientHeight = 327
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
  object btnCreate: TButton
    Left = 24
    Top = 30
    Width = 99
    Height = 25
    Caption = 'btnCreate'
    TabOrder = 0
    OnClick = btnCreateClick
  end
  object btnTerminate: TButton
    Left = 24
    Top = 80
    Width = 99
    Height = 25
    Caption = 'btnTerminate'
    TabOrder = 1
    OnClick = btnTerminateClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 308
    Width = 554
    Height = 19
    Panels = <>
    ExplicitLeft = 120
    ExplicitTop = 264
    ExplicitWidth = 0
  end
  object Memo1: TMemo
    Left = 144
    Top = 32
    Width = 393
    Height = 257
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 64
    Top = 160
  end
end
