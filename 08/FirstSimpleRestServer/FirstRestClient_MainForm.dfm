object FormFirstRestClient: TFormFirstRestClient
  Left = 0
  Top = 0
  Caption = 'FirstRestClient'
  ClientHeight = 168
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPlainCall: TButton
    Left = 32
    Top = 73
    Width = 129
    Height = 25
    Caption = 'btnPlainCall'
    TabOrder = 0
    OnClick = btnPlainCallClick
  end
  object btnToJSON: TButton
    Left = 176
    Top = 73
    Width = 137
    Height = 25
    Caption = 'btnToJSON'
    TabOrder = 1
    OnClick = btnToJSONClick
  end
  object edInput: TEdit
    Left = 32
    Top = 30
    Width = 281
    Height = 21
    TabOrder = 2
    Text = 'Hello from a Delphi Client Application'
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 240
    Top = 120
  end
end
