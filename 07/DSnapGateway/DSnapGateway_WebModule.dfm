object WebModule3: TWebModule3
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule3DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    RESTContext = 'rest'
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'datasnap*'
    Left = 112
    Top = 51
  end
end
