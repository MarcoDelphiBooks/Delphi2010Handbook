object WebModule2: TWebModule2
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule2DefaultHandlerAction
    end
    item
      Name = 'WebActionItem1'
      PathInfo = '/file'
      OnAction = WebModule2WebActionItem1Action
    end>
  Height = 230
  Width = 415
  object DSServer1: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 96
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    RESTContext = 'rest'
    Server = DSServer1
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 200
    Top = 11
  end
end
