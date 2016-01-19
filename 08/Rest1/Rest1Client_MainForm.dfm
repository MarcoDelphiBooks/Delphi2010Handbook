object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Rest1Client'
  ClientHeight = 323
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblEcho: TLabel
    Left = 328
    Top = 19
    Width = 33
    Height = 13
    Caption = 'lblEcho'
  end
  object edEcho: TEdit
    Left = 16
    Top = 16
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'hello world'
  end
  object btnEcho: TButton
    Left = 208
    Top = 16
    Width = 89
    Height = 21
    Caption = 'btnEcho'
    TabOrder = 1
    OnClick = btnEchoClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 425
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnCDS: TButton
    Left = 448
    Top = 56
    Width = 126
    Height = 25
    Caption = 'btnCDS'
    TabOrder = 3
    OnClick = btnCDSClick
  end
  object ListCust: TListBox
    Left = 17
    Top = 182
    Width = 233
    Height = 129
    ItemHeight = 13
    TabOrder = 4
    OnDblClick = ListCustDblClick
  end
  object MemoCust: TMemo
    Left = 256
    Top = 184
    Width = 185
    Height = 129
    TabOrder = 5
  end
  object btnCustList: TButton
    Left = 448
    Top = 184
    Width = 126
    Height = 25
    Caption = 'btnCustList'
    TabOrder = 6
    OnClick = btnCustListClick
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
    Left = 520
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 520
    Top = 112
  end
end
