object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 96
    Top = 11
  end
  object DSHTTPService1: TDSHTTPService
    RESTContext = 'rest'
    Server = DSServer1
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    AuthenticationManager = DSHTTPServiceAuthenticationManager1
    HttpPort = 8090
    Active = False
    Left = 96
    Top = 135
  end
  object DSHTTPServiceAuthenticationManager1: TDSHTTPServiceAuthenticationManager
    HTTPAuthenticate = DSHTTPServiceAuthenticationManager1HTTPAuthenticate
    Left = 96
    Top = 197
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 200
    Top = 11
  end
end
