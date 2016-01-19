object CustomGestureForm: TCustomGestureForm
  Left = 0
  Top = 0
  Caption = 'CustomGestureTest'
  ClientHeight = 416
  ClientWidth = 892
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
  object Panel1: TPanel
    Left = 24
    Top = 43
    Width = 561
    Height = 336
    Caption = 'Panel1'
    TabOrder = 0
    Touch.GestureManager = GestureManager1
    OnGesture = Panel1Gesture
  end
  object GestureListView1: TGestureListView
    Left = 608
    Top = 16
    Width = 250
    Height = 145
    Columns = <
      item
        AutoSize = True
        Caption = 'Name'
      end>
    GestureManager = GestureManager1
    ImageSize = 24
    TabOrder = 1
    Touch.GestureManager = GestureManager1
  end
  object GesturePreview1: TGesturePreview
    Left = 608
    Top = 179
    Width = 250
    GestureProvider = GestureListView1
  end
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 561
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object GestureManager1: TGestureManager
    Left = 64
    Top = 208
    CustomGestures = <
      item
        Deviation = 34
        ErrorMargin = 46
        GestureID = -1
        Name = 'eight'
        Options = 9
        Points = {
          01790000005A006D0053006A004A006700450065003E00610038005D00310059
          002C00550024004E00200047001C00410019003B00170036001600320015002E
          00150029001500240015001F0015001A0017001500190011001D000D00230007
          002A00030030000200390000003E000000460000004C000000540000005A0000
          0061000100680004006D000600730009007A000F007E00150080001A0080001E
          00810022008200270082003000820034008200390082003E0082004200820046
          0080004C007E0052007A0056007600590072005C006C005F00650062005C0065
          005500680050006A004A006D0046006F00400070003B00720036007400310078
          002D007B0028007F00220084001B008A0016008F00120096000B009E000900A2
          000600A6000300AB000100AF000000B5000000BB000000BF000500C5000900CB
          000D00CE001100D0001A00D4002000D6002600D7002B00D8003200D9003B00D9
          004000D9004A00D9005100D9005B00D7006000D6006A00D5006F00D3007300D1
          007800CF007D00CC008100CB008400C7008800C2008B00BD008D00B8008F00B3
          009000AF009100AA009100A6009000A2008D009D008A0097008600930082008F
          007F008B007A00880076008500720083006E0080006A007E0065007A005E0074
          005A00700055006E00}
      end
      item
        Deviation = 20
        ErrorMargin = 20
        GestureID = -2
        Name = 'Seven'
        Options = 9
        Points = {
          01610000000000000004000000080000000E000000150000001B000000200001
          002900010030000100370001003D00010043000100490001004F000100550001
          005A00010060000100660001006D000100740001007A0001007F000100840001
          008A00010090000100950001009B000100A1000100AA000100B3000100B80001
          00BE000100C5000100CB000100D2000100D8000100DF000100E5000100EE0001
          00F6000000FD00000004010000090100000E0100001301000017010000180104
          0015010900100110000D01140009011A0004011E0000012300FB002800F7002D
          00F2003100ED003500E8003800E2003D00DC004200D4004700CD004D00C50051
          00BE005500B6005A00B0005F00AA006300A4006700A00069009C006C0098006F
          00920073008E00760085007C0080007F007A008400740089006E008E00680093
          00610099005B00A0005300A5004C00AB004700B0004100B5003A00BA003500BE
          002E00C4002A00C8002600CB002200CE001D00D2001700D6001100DB000D00DD
          000900E2000600E600}
      end>
    GestureData = <
      item
        Control = Panel1
        Collection = <
          item
            GestureID = sgiLeft
          end
          item
            GestureID = sgiRight
          end
          item
            GestureID = sgiUp
          end
          item
            GestureID = sgiDown
          end
          item
            GestureID = sgiCheck
          end
          item
            Action = EditPaste1
            GestureID = sgiCircle
          end
          item
            Action = FileOpen1
            GestureID = sgiTriangle
          end
          item
            Action = Action1
            GestureID = -1
          end>
      end
      item
        Control = GestureListView1
        Collection = <
          item
            GestureID = sgiLeft
          end
          item
            GestureID = sgiRight
          end
          item
            GestureID = sgiUp
          end
          item
            GestureID = sgiDown
          end
          item
            GestureID = sgiCircle
          end>
      end>
  end
  object ActionList1: TActionList
    Left = 440
    Top = 216
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object FileOpen1: TFileOpen
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
    end
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
  end
end
