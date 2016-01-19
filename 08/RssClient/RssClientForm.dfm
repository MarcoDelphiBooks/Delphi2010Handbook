object RssForm: TRssForm
  Left = 0
  Top = 0
  Caption = 'RssClient'
  ClientHeight = 332
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object ListBox1: TListBox
    Left = 0
    Top = 41
    Width = 511
    Height = 291
    Align = alClient
    ItemHeight = 19
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnUpdate: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 0
      OnClick = btnUpdateClick
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 40
    Top = 72
    DOMVendorDesc = 'MSXML'
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
    Left = 40
    Top = 136
  end
end
