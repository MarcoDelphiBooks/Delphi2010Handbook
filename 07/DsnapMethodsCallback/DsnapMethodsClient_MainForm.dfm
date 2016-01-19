object FormDsmcMain: TFormDsmcMain
  Left = 0
  Top = 0
  Caption = 'DsnapMethodsClient Main'
  ClientHeight = 292
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnNewForm: TButton
    Left = 16
    Top = 8
    Width = 91
    Height = 25
    Caption = 'btnNewForm'
    TabOrder = 0
    OnClick = btnNewFormClick
  end
  object btnUpdateStatus: TButton
    Left = 120
    Top = 8
    Width = 97
    Height = 25
    Caption = 'btnUpdateStatus'
    TabOrder = 1
    OnClick = btnUpdateStatusClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 40
    Width = 417
    Height = 241
    TabOrder = 2
  end
  object rgLifeCycle: TRadioGroup
    Left = 447
    Top = 40
    Width = 138
    Height = 113
    Caption = 'rgLifeCycle'
    ItemIndex = 0
    Items.Strings = (
      'Session'
      'Invocation'
      'Server')
    TabOrder = 3
  end
  object btnStartServer: TButton
    Left = 448
    Top = 8
    Width = 97
    Height = 25
    Caption = 'btnStartServer'
    TabOrder = 4
    OnClick = btnStartServerClick
  end
end
