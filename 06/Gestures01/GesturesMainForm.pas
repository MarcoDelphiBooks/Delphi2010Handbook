unit GesturesMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GestureMgr, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    GestureManager1: TGestureManager;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Panel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  nGesture: Integer;
  gestureItem: TCustomGestureCollectionItem;
begin
  nGesture := EventInfo.GestureID;
  gestureItem := GestureManager1.FindGesture(self, nGesture);
  if Assigned (gestureItem) then
    Log (Format ('Gesture: %s [%d]', [gestureItem.Name, nGesture]))
  else
    Log (Format ('Unrecognized gesture [%d]', [nGesture]));
  Handled := True;
end;

procedure TForm1.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

procedure TForm1.Panel1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  Log ('Panel Gesture');
end;

end.
