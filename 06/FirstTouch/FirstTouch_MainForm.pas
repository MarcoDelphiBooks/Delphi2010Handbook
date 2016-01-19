unit FirstTouch_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    { Private declarations }
  public
    procedure WMTouch(var Message: TMessage); message WM_TOUCH;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.CreateWnd;
begin
  inherited;
  RegisterTouchWindow(Handle, 0);
end;

procedure TForm1.DestroyWnd;
begin
  inherited;
  UnregisterTouchWindow(Handle);
end;

procedure TForm1.WMTouch(var Message: TMessage);

 function TouchPointToPoint(const TouchPoint: TTouchInput): TPoint;
  begin
    Result := Point(TouchPoint.X div 100, TouchPoint.Y div 100);
    PhysicalToLogicalPoint(Handle, Result);
  end;

var
  TouchInputs: array of TTouchInput;
  TouchInput: TTouchInput;
  Handled: Boolean;
  Point: TPoint;

begin
  Memo1.Clear;
  Handled := False;
  SetLength(TouchInputs, Message.WParam);
  GetTouchInputInfo(Message.LParam, Message.WParam, @TouchInputs[0],
    SizeOf(TTouchInput));
  try
    for TouchInput in TouchInputs do
    begin
      Point := TouchPointToPoint(TouchInput);
      Memo1.Lines.Add(Format ('%d:%d', [Point.X, Point.Y]));
    end;

    Handled := True;
  finally
    if Handled then
      CloseTouchInputHandle(Message.LParam)
    else
      inherited;
  end;
end;

end.
