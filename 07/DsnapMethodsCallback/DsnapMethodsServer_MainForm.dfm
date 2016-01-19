object FormDsnapMethodsServer: TFormDsnapMethodsServer
  Left = 0
  Top = 0
  Caption = 'DsnapMethodsServer'
  ClientHeight = 283
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 26
    Width = 401
    Height = 249
    TabOrder = 0
  end
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    OnDisconnect = DSServer1Disconnect
    AutoStart = True
    HideDSAdmin = False
    Left = 48
    Top = 96
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 128
    Top = 128
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 20
    Server = DSServer1
    BufferKBSize = 32
    Filters = <>
    Left = 88
    Top = 176
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    OnDestroyInstance = DSSC2DestroyInstance
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 192
    Top = 200
  end
end
