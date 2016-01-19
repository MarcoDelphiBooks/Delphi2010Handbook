object ConsoleClientForm: TConsoleClientForm
  Left = 0
  Top = 0
  Caption = 'ConsoleClientForm'
  ClientHeight = 183
  ClientWidth = 249
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
  object btnCallEcho: TButton
    Left = 64
    Top = 32
    Width = 105
    Height = 41
    Caption = 'btnCallEcho'
    TabOrder = 0
    OnClick = btnCallEchoClick
  end
  object btnProxy: TButton
    Left = 64
    Top = 96
    Width = 105
    Height = 41
    Caption = 'btnProxy'
    TabOrder = 1
    OnClick = btnProxyClick
  end
  object FIRST: TSQLConnection
    ConnectionName = 'FIRST'
    DriverName = 'DATASNAP'
    LoginPrompt = False
    Params.Strings = (
      'drivername=DATASNAP'
      'port=8090'
      'communicationprotocol=http'
      'hostname=localhost'
      'DSAuthenticationUser=marco'
      'DSAuthenticationPassword=123')
    Connected = True
    Left = 50
    Top = 34
  end
  object TServerMethods1_EchoString: TSQLDataSet
    CommandText = 'TServerMethods1.EchoString'
    CommandType = ctServerMethod
    DbxCommandType = 'DataSnap.ServerMethod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Value'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = FIRST
    Left = 197
    Top = 53
  end
end
