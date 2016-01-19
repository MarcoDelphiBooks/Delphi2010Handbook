object FormMap: TFormMap
  Left = 0
  Top = 0
  Caption = 'GeoLocation'
  ClientHeight = 364
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
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
    ItemHeight = 19
    TabOrder = 1
  end
  object btnGeocoding: TButton
    Left = 208
    Top = 8
    Width = 169
    Height = 25
    Caption = 'Geocoding'
    TabOrder = 2
    OnClick = btnGeocodingClick
  end
  object DBGrid1: TDBGrid
    Left = 208
    Top = 39
    Width = 545
    Height = 298
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    Left = 232
    Top = 24
  end
  object cdsTown: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'town'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Latitude'
        DataType = ftFloat
      end
      item
        Name = 'Longitude'
        DataType = ftFloat
      end
      item
        Name = 'Count'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = cdsTown
    Left = 272
    Top = 296
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'customer.cds'
    Params = <>
    Left = 288
    Top = 24
  end
end
