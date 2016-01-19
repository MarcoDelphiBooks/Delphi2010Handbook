object FormTypeInfo: TFormTypeInfo
  Left = 0
  Top = 0
  Caption = 'FormTypeInfo'
  ClientHeight = 308
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 600
    Height = 17
    Sections = <
      item
        ImageIndex = -1
        MinWidth = 100
        Text = 'Properties'
        Width = 200
      end
      item
        ImageIndex = -1
        MinWidth = 200
        Text = 'Methods'
        Width = 200
      end
      item
        ImageIndex = -1
        MinWidth = 100
        Text = 'Fields'
        Width = 200
      end>
    OnSectionResize = HeaderControl1SectionResize
    ExplicitLeft = 232
    ExplicitTop = 40
    ExplicitWidth = 0
  end
  object ListProperties: TListBox
    Left = 0
    Top = 17
    Width = 200
    Height = 291
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
  end
  object ListMethods: TListBox
    Left = 200
    Top = 17
    Width = 200
    Height = 291
    Align = alLeft
    ItemHeight = 13
    TabOrder = 2
  end
  object ListFields: TListBox
    Left = 400
    Top = 17
    Width = 200
    Height = 291
    Align = alClient
    ItemHeight = 13
    TabOrder = 3
    ExplicitLeft = 472
    ExplicitTop = 88
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
end
