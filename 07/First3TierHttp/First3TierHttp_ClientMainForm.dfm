object FormFirst3Tier2009Client: TFormFirst3Tier2009Client
  Left = 0
  Top = 0
  Caption = 'First3TierHttp Client'
  ClientHeight = 339
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 56
    Width = 625
    Height = 257
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnOpen: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnOpen'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object btnHello: TButton
    Left = 112
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnHello'
    TabOrder = 2
    OnClick = btnHelloClick
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TDSFirst3TierServerModule'
    SQLConnection = SQLConnection1
    Left = 176
    Top = 160
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=8090'
      'CommunicationProtocol=http'
      'DriverUnit=DBXDataSnap')
    Left = 344
    Top = 120
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderEmployee'
    RemoteServer = DSProviderConnection1
    BeforeEdit = ClientDataSet1BeforeEdit
    AfterPost = ClientDataSet1AfterPost
    Left = 96
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 272
    Top = 152
  end
  object SqlServerMethod1: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 2000
        Value = 'Hello from TDSFirst3TierServerModule at 11:30:51 PM'
      end>
    SQLConnection = SQLConnection1
    ServerMethodName = 'TDSFirst3TierServerModule.GetHello'
    Left = 216
    Top = 96
  end
  object FIRST: TSQLConnection
    ConnectionName = 'FIRST'
    DriverName = 'DATASNAP'
    LoginPrompt = False
    Params.Strings = (
      'drivername=DATASNAP'
      'port=8090'
      'communicationprotocol=http'
      'hostname=localhost')
    Left = 65
    Top = 65
  end
end
