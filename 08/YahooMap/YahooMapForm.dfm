object FormMap: TFormMap
  Left = 0
  Top = 0
  Caption = 'YahooMap'
  ClientHeight = 352
  ClientWidth = 781
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
  object Image1: TImage
    Left = 208
    Top = 39
    Width = 553
    Height = 298
  end
  object btnGetTowns: TButton
    Left = 24
    Top = 8
    Width = 169
    Height = 25
    Caption = 'GetTowns'
    TabOrder = 0
    OnClick = btnGetTownsClick
  end
  object ListBox1: TListBox
    Left = 24
    Top = 39
    Width = 169
    Height = 298
    ItemHeight = 13
    TabOrder = 1
  end
  object btnGeocoding: TButton
    Left = 208
    Top = 8
    Width = 169
    Height = 25
    Caption = 'GetMap'
    TabOrder = 2
    OnClick = btnGeocodingClick
  end
  object Button1: TButton
    Left = 384
    Top = 8
    Width = 137
    Height = 25
    Caption = 'San Jose'
    TabOrder = 3
    OnClick = Button1Click
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = []
    Left = 232
    Top = 24
  end
  object XMLDocument1: TXMLDocument
    Left = 232
    Top = 88
    DOMVendorDesc = 'MSXML'
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'customer.cds'
    Params = <>
    Left = 32
    Top = 48
  end
end
