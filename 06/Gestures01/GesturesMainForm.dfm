object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Gestures01'
  ClientHeight = 310
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Touch.GestureManager = GestureManager1
  OnGesture = FormGesture
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 400
    Top = 8
    Width = 263
    Height = 288
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 377
    Height = 121
    Caption = 'Panel1'
    TabOrder = 1
    Touch.GestureManager = GestureManager1
    Touch.ParentTabletOptions = False
    Touch.TabletOptions = []
    OnGesture = Panel1Gesture
  end
  object GestureManager1: TGestureManager
    Left = 48
    Top = 200
    GestureData = <
      item
        Control = Owner
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
            GestureID = sgiUpLeft
          end
          item
            GestureID = sgiUpRight
          end
          item
            GestureID = sgiDownLeft
          end
          item
            GestureID = sgiDownRight
          end
          item
            GestureID = sgiLeftUp
          end
          item
            GestureID = sgiLeftDown
          end
          item
            GestureID = sgiRightUp
          end
          item
            GestureID = sgiRightDown
          end
          item
            GestureID = sgiUpDown
          end
          item
            GestureID = sgiDownUp
          end
          item
            GestureID = sgiLeftRight
          end
          item
            GestureID = sgiRightLeft
          end
          item
            GestureID = sgiUpLeftLong
          end
          item
            GestureID = sgiUpRightLong
          end
          item
            GestureID = sgiDownLeftLong
          end
          item
            GestureID = sgiDownRightLong
          end
          item
            GestureID = sgiScratchout
          end
          item
            GestureID = sgiTriangle
          end
          item
            GestureID = sgiSquare
          end
          item
            GestureID = sgiCheck
          end
          item
            GestureID = sgiCurlicue
          end
          item
            GestureID = sgiDoubleCurlicue
          end
          item
            GestureID = sgiCircle
          end
          item
            GestureID = sgiDoubleCircle
          end
          item
            GestureID = sgiSemiCircleLeft
          end
          item
            GestureID = sgiSemiCircleRight
          end
          item
            GestureID = sgiChevronUp
          end
          item
            GestureID = sgiChevronDown
          end
          item
            GestureID = sgiChevronLeft
          end
          item
            GestureID = sgiChevronRight
          end>
      end
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
            GestureID = sgiDownLeft
          end
          item
            GestureID = sgiDownRight
          end
          item
            GestureID = sgiLeftUp
          end
          item
            GestureID = sgiLeftDown
          end
          item
            GestureID = sgiRightUp
          end
          item
            GestureID = sgiRightDown
          end
          item
            GestureID = sgiUpDown
          end
          item
            GestureID = sgiDownUp
          end
          item
            GestureID = sgiLeftRight
          end
          item
            GestureID = sgiRightLeft
          end
          item
            GestureID = sgiUpLeftLong
          end
          item
            GestureID = sgiUpRightLong
          end
          item
            GestureID = sgiDownLeftLong
          end
          item
            GestureID = sgiDownRightLong
          end
          item
            GestureID = sgiScratchout
          end
          item
            GestureID = sgiTriangle
          end
          item
            GestureID = sgiSquare
          end
          item
            GestureID = sgiCheck
          end
          item
            GestureID = sgiCurlicue
          end
          item
            GestureID = sgiDoubleCurlicue
          end
          item
            GestureID = sgiCircle
          end
          item
            GestureID = sgiDoubleCircle
          end
          item
            GestureID = sgiSemiCircleLeft
          end
          item
            GestureID = sgiSemiCircleRight
          end
          item
            GestureID = sgiChevronUp
          end
          item
            GestureID = sgiChevronDown
          end
          item
            GestureID = sgiChevronLeft
          end
          item
            GestureID = sgiChevronRight
          end
          item
            GestureID = sgiUpLeft
          end
          item
            GestureID = sgiUpRight
          end>
      end>
  end
end
