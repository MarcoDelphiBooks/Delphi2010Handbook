object FormEditGest: TFormEditGest
  Left = 0
  Top = 0
  Caption = 'EditGestures'
  ClientHeight = 235
  ClientWidth = 618
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
  object lbEditFirstName: TLabeledEdit
    Left = 40
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'lbEditFirstName'
    TabOrder = 0
  end
  object lbEditLastName: TLabeledEdit
    Left = 40
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'lbEditLastName'
    TabOrder = 1
  end
  object lblEditCity: TLabeledEdit
    Left = 40
    Top = 128
    Width = 121
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'lblEditCity'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 360
    Top = 8
    Width = 250
    Height = 219
    TabOrder = 3
  end
  object GestureManager1: TGestureManager
    Left = 48
    Top = 176
    GestureData = <
      item
        Control = Owner
        Collection = <
          item
            Action = EditPaste1
            GestureID = sgiCheck
          end
          item
            Action = EditCut1
            GestureID = sgiChevronUp
          end
          item
            Action = EditClear1
            GestureID = sgiScratchout
          end>
      end>
  end
  object ActionList1: TActionList
    OnExecute = ActionList1Execute
    Left = 128
    Top = 176
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 5
      ShortCut = 46
    end
    object EditClear1: TAction
      Category = 'Edit'
      Caption = 'EditClear1'
      OnExecute = EditClear1Execute
    end
  end
end
