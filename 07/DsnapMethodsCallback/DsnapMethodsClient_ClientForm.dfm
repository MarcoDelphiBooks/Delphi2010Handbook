object FormDsmcClient: TFormDsmcClient
  Left = 0
  Top = 0
  Caption = 'DsnapMethodsClient Client'
  ClientHeight = 297
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblToString: TLabel
    Left = 168
    Top = 252
    Width = 50
    Height = 13
    Caption = 'lblToString'
  end
  object lblPrimes: TLabel
    Left = 296
    Top = 61
    Width = 41
    Height = 13
    Caption = 'lblPrimes'
  end
  object lblGet: TLabel
    Left = 168
    Top = 221
    Width = 27
    Height = 13
    Caption = 'lblGet'
  end
  object lblPrimesTh: TLabel
    Left = 168
    Top = 128
    Width = 53
    Height = 13
    Caption = 'lblPrimesTh'
  end
  object lblPrimesCall: TLabel
    Left = 296
    Top = 91
    Width = 41
    Height = 13
    Caption = 'lblPrimes'
    OnClick = lblPrimesCallClick
  end
  object btnEcho: TButton
    Left = 80
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnEcho'
    TabOrder = 0
    OnClick = btnEchoClick
  end
  object Edit1: TEdit
    Left = 161
    Top = 26
    Width = 176
    Height = 21
    TabOrder = 1
    Text = 'Marco'
  end
  object btnFormSet: TButton
    Left = 80
    Top = 184
    Width = 75
    Height = 25
    Caption = 'btnFormSet'
    TabOrder = 2
    OnClick = btnFormSetClick
  end
  object btnFormGet: TButton
    Left = 80
    Top = 216
    Width = 75
    Height = 25
    Caption = 'btnFormGet'
    TabOrder = 3
    OnClick = btnFormGetClick
  end
  object SpinEdit1: TSpinEdit
    Left = 168
    Top = 186
    Width = 169
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object btnToString: TButton
    Left = 80
    Top = 247
    Width = 75
    Height = 25
    Caption = 'btnToString'
    TabOrder = 5
    OnClick = btnToStringClick
  end
  object btnPrimes: TButton
    Left = 80
    Top = 56
    Width = 75
    Height = 25
    Caption = 'btnPrimes'
    TabOrder = 6
    OnClick = btnPrimesClick
  end
  object SpinEdit2: TSpinEdit
    Left = 161
    Top = 58
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 10000
  end
  object btnPrimesTh: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btnPrimesTh'
    TabOrder = 8
    OnClick = btnPrimesThClick
  end
  object btnPrimesCall: TButton
    Left = 80
    Top = 86
    Width = 75
    Height = 25
    Caption = 'btnPrimesCall'
    TabOrder = 9
    OnClick = btnPrimesCallClick
  end
  object SpinEdit3: TSpinEdit
    Left = 161
    Top = 88
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 10
    Value = 10000
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap')
    Left = 32
    Top = 80
  end
end
