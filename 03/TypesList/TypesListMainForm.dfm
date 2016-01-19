object FormTypesList: TFormTypesList
  Left = 0
  Top = 0
  Caption = 'TypesList'
  ClientHeight = 546
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTypesList: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnTypesList'
    TabOrder = 0
    OnClick = btnTypesListClick
  end
  object ListBox1: TListBox
    Left = 96
    Top = 8
    Width = 441
    Height = 193
    ItemHeight = 13
    TabOrder = 1
  end
  object TreeView1: TTreeView
    Left = 96
    Top = 216
    Width = 441
    Height = 297
    Indent = 19
    TabOrder = 2
    OnDblClick = TreeView1DblClick
  end
  object btnHierarchy: TButton
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'btnHierarchy'
    TabOrder = 3
    OnClick = btnHierarchyClick
  end
  object btnPackages: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'btnPackages'
    TabOrder = 4
    OnClick = btnPackagesClick
  end
  object Button1: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = 'btnMemory'
    TabOrder = 5
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 527
    Width = 561
    Height = 19
    Panels = <>
    SimplePanel = True
  end
end
