unit EditGestures_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, GestureMgr, StdCtrls, ExtCtrls;

type
  TFormEditGest = class(TForm)
    lbEditFirstName: TLabeledEdit;
    lbEditLastName: TLabeledEdit;
    lblEditCity: TLabeledEdit;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    EditClear1: TAction;
    Memo1: TMemo;
    procedure EditClear1Execute(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure ActionList1Execute(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormEditGest: TFormEditGest;

implementation

{$R *.dfm}

procedure TFormEditGest.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  Log ('Action: ' + Action.Name);
end;

procedure TFormEditGest.EditClear1Execute(Sender: TObject);
begin
  if (ActiveControl is TCustomEdit) then
    TCustomEdit(ActiveControl).Clear;
end;

procedure TFormEditGest.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  Log ('Gesture performed');
end;

procedure TFormEditGest.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
