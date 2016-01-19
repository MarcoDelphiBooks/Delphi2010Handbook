object KeyboardForm: TKeyboardForm
  Left = 0
  Top = 0
  Caption = 'KeyboardTest'
  ClientHeight = 340
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 20
  object TouchKeyboard1: TTouchKeyboard
    Left = 32
    Top = 88
    Width = 623
    Height = 233
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
  object LabeledEdit1: TLabeledEdit
    Left = 32
    Top = 40
    Width = 265
    Height = 28
    EditLabel.Width = 87
    EditLabel.Height = 20
    EditLabel.Caption = 'LabeledEdit1'
    TabOrder = 1
  end
  object LabeledEdit2: TLabeledEdit
    Left = 303
    Top = 40
    Width = 273
    Height = 28
    EditLabel.Width = 87
    EditLabel.Height = 20
    EditLabel.Caption = 'LabeledEdit2'
    TabOrder = 2
  end
  object btnTest: TButton
    Left = 582
    Top = 39
    Width = 73
    Height = 31
    Caption = 'Test'
    TabOrder = 3
    OnClick = btnTestClick
  end
end
