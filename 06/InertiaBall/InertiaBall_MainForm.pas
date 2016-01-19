unit InertiaBall_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InertiaBall_TheBall, ExtCtrls;

type
  TInertiaForm = class(TForm)
    Timer1: TTimer;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FMouseDown: Boolean;
    aBall: TBall;
  public
    { Public declarations }
  end;

var
  InertiaForm: TInertiaForm;

implementation

{$R *.dfm}

procedure TInertiaForm.FormCreate(Sender: TObject);
begin
  // disable div by 0 exceptions for the inertia processor
  Set8087CW($133F);

  aBall := TBall.Create (self);
  aBall.X := Width div 2;
  aBall.Y := Height div 2;
  aBall.Radius := 20;
  aBall.Color := clRed;
  aBall.ID := 1;
end;

procedure TInertiaForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  aBall.MouseDown(X, Y);
  Invalidate;
  FMouseDown := True;
end;

procedure TInertiaForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FMouseDown then
  begin
    aBall.MouseMove(X, Y);
    Invalidate;
  end;
end;

procedure TInertiaForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  aBall.MouseUp (X, Y);
  FMouseDown := False;
  Invalidate;
  Timer1.Enabled := True;
end;

procedure TInertiaForm.FormPaint(Sender: TObject);
begin
  aBall.Paint(Canvas);
  DrawFocusRect(Canvas.Handle,
    Rect (100, 100, Width-100, Height-100));
  DrawFocusRect(Canvas.Handle,
    Rect (200, 200, Width-200, Height-200));
end;

procedure TInertiaForm.Timer1Timer(Sender: TObject);
begin
  aBall.ProcessInertia;
  Invalidate;
end;

end.
