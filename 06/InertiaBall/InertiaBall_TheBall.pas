unit InertiaBall_TheBall;

interface

uses
  Classes, Manipulations, SysUtils, Graphics, Forms;

type
  TBall = class (TInterfacedObject, _IManipulationEvents)
  private
    FInertia: IInertiaProcessor;
    FManipulator: IManipulationProcessor;
    FInertiaCookie, FManipulatorCookie: LongInt;
    FCompleted: LongBool;
  public
    X, Y, Radius: Integer;
    Color: TColor;
    ID: Integer;

    { _IManipulationEvents }
    function ManipulationStarted(X: Single; Y: Single): HRESULT; stdcall;
    function ManipulationDelta(X: Single; Y: Single; translationDeltaX: Single;
      translationDeltaY: Single; scaleDelta: Single; expansionDelta: Single;
      rotationDelta: Single; cumulativeTranslationX: Single;
      cumulativeTranslationY: Single; cumulativeScale: Single;
      cumulativeExpansion: Single; cumulativeRotation: Single): HRESULT;
      stdcall;
    function ManipulationCompleted(X: Single; Y: Single;
      cumulativeTranslationX: Single; cumulativeTranslationY: Single;
      cumulativeScale: Single; cumulativeExpansion: Single;
      cumulativeRotation: Single): HRESULT; stdcall;
  public
    constructor Create (aForm: TForm);
    procedure Paint(Canvas: TCanvas);
    procedure MouseMove (X, Y: Integer);
    procedure MouseDown (X, Y: Integer);
    procedure MouseUp (X, Y: Integer);
    procedure Disconnect;
    procedure ProcessInertia;
  end;

implementation

uses
  ComObj, Windows;

{ TBall }

constructor TBall.Create (aForm: TForm);
begin
  inherited Create;

  ID := 1;
  FCompleted := True;

  FInertia := CreateComObject(CLSID_IInertiaProcessor) as IInertiaProcessor;
  FManipulator := CreateComObject(CLSID_IManipulationProcessor) as IManipulationProcessor;
  InterfaceConnect(FInertia, _IManipulationEvents, Self, FInertiaCookie);
  InterfaceConnect(FManipulator, _IManipulationEvents, Self, FManipulatorCookie);

  FInertia.put_DesiredDeceleration(0.001);

  FInertia.put_BoundaryLeft(200);
  FInertia.put_BoundaryTop(200);
  FInertia.put_BoundaryRight(aForm.Width - 200);
  FInertia.put_BoundaryBottom(aForm.Height - 200);

  FInertia.put_ElasticMarginLeft(100);
  FInertia.put_ElasticMarginTop(100);
  FInertia.put_ElasticMarginRight(100);
  FInertia.put_ElasticMarginBottom(100);
end;

procedure TBall.Disconnect;
begin
  InterfaceDisconnect(FInertia, _IManipulationEvents, FInertiaCookie);
  InterfaceDisconnect(FManipulator, _IManipulationEvents, FManipulatorCookie);
end;

function TBall.ManipulationCompleted(X, Y, cumulativeTranslationX,
  cumulativeTranslationY, cumulativeScale, cumulativeExpansion,
  cumulativeRotation: Single): HRESULT;
begin
  Result := S_OK;
end;

function TBall.ManipulationDelta(X, Y, translationDeltaX, translationDeltaY,
  scaleDelta, expansionDelta, rotationDelta, cumulativeTranslationX,
  cumulativeTranslationY, cumulativeScale, cumulativeExpansion,
  cumulativeRotation: Single): HRESULT;
begin
  self.X := Round (X);
  self.Y := Round (Y);
//  Inc(self.X, Round(translationDeltaX));
//  Inc(self.Y, Round(translationDeltaY));
  Result := S_OK;
end;

function TBall.ManipulationStarted(X, Y: Single): HRESULT;
begin
  Result := S_OK;
end;

procedure TBall.MouseDown(X, Y: Integer);
begin
  FManipulator.ProcessDown(ID, X, Y);
end;

procedure TBall.MouseMove(X, Y: Integer);
begin
  FManipulator.ProcessMove(ID, X, Y);
end;

procedure TBall.MouseUp(X, Y: Integer);
var
  vx, vy: Single;
begin
  FManipulator.ProcessUp(ID, X, Y);

  FManipulator.GetVelocityX(Vx);
  FManipulator.GetVelocityY(Vy);

  FInertia.put_InitialVelocityX(Vx);
  FInertia.put_InitialVelocityY(Vy);

  FInertia.put_InitialOriginX(X);
  FInertia.put_InitialOriginY(Y);

  FCompleted := False;
end;

procedure TBall.Paint(Canvas: TCanvas);
begin
  Canvas.Brush.Color := self.Color;
  Canvas.Ellipse(x-Radius, y-radius, x+radius, y+radius);
end;

procedure TBall.ProcessInertia;
var
  vx: single;
begin
  if not FCompleted then
    FInertia.Process(FCompleted);

  // debug information
//  Application.MainForm.Caption := BoolToStr (FCompleted, True);
//
//  FManipulator.GetVelocityX (vx);
//  Application.MainForm.Caption :=
//    Application.MainForm.Caption + ' - ' + FloatToStr (vx);
end;

end.
