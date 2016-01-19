object D2DForm: TD2DForm
  Left = 0
  Top = 0
  Caption = 'D2DIntro'
  ClientHeight = 513
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 16
    object FromCanvas1: TMenuItem
      AutoCheck = True
      Caption = 'Form Canvas'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = FromCanvas1Click
    end
    object FormHandle1: TMenuItem
      AutoCheck = True
      Caption = 'Form Handle'
      GroupIndex = 1
      RadioItem = True
      OnClick = FormHandle1Click
    end
  end
end
