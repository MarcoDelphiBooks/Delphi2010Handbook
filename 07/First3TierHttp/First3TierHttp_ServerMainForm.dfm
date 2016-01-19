object FormFirst3Tier2009Server: TFormFirst3Tier2009Server
  Left = 0
  Top = 0
  Caption = 'First3TierHttp Server'
  ClientHeight = 227
  ClientWidth = 438
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
    Left = 0
    Top = 0
    Width = 438
    Height = 227
    Align = alClient
    TabOrder = 0
  end
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    OnDisconnect = DSServer1Disconnect
    AutoStart = True
    HideDSAdmin = False
    Left = 120
    Top = 176
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 336
    Top = 176
  end
  object DSHTTPService1: TDSHTTPService
    RESTContext = 'rest'
    Server = DSServer1
    DSHostname = 'localhost'
    DSPort = 0
    Filters = <>
    HttpPort = 8090
    Active = False
    Left = 216
    Top = 176
  end
end
