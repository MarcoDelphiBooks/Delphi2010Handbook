unit CustomGestureTest_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GestureMgr, ExtCtrls, ComCtrls, GestureCtrls, StdCtrls, ActnList,
  StdActns;

type
  TCustomGestureForm = class(TForm)
    Panel1: TPanel;
    GestureManager1: TGestureManager;
    GestureListView1: TGestureListView;
    GesturePreview1: TGesturePreview;
    ActionList1: TActionList;
    EditPaste1: TEditPaste;
    Edit1: TEdit;
    FileOpen1: TFileOpen;
    Action1: TAction;
    procedure Panel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomGestureForm: TCustomGestureForm;

implementation

{$R *.dfm}

procedure TCustomGestureForm.Action1Execute(Sender: TObject);
begin
  ShowMessage ('eight');
end;

procedure TCustomGestureForm.FormCreate(Sender: TObject);
begin
  GestureListView1.AddGesture(sgiLeft);
  // GestureListView1.ClearGestureList;
  GestureListView1.AddGestures(Panel1);
end;

procedure TCustomGestureForm.Panel1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiLeft: Panel1.Caption := 'Left';
    sgiRight: Panel1.Caption := 'Right';
    sgiUp: Panel1.Caption := 'Up';
    sgiDown: Panel1.Caption := 'Down';
    sgiCheck: Close;
  else
    Panel1.Caption := IntToStr (EventInfo.GestureID);
  end;
end;

end.
