unit D2DLinesSpeed_Direct2DOnly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Direct2D, Diagnostics;

type
  TForm2 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    stopW: TStopwatch;
    FCanvas: TDirect2DCanvas;
  protected
    procedure CreateWnd; override;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  public
    property Canvas: TDirect2DCanvas read FCanvas;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  D2D1;

{ TForm2 }

const
  maxLines = 100000;

procedure TForm2.CreateWnd;
begin
  inherited;
  FCanvas := TDirect2DCanvas.Create(Handle);
end;

procedure TForm2.FormPaint(Sender: TObject);
var
  I: Integer;
  pt1, pt2: TD2DPoint2f;
  theWitdh, theHeight: Integer;
begin
  theWitdh := self.Width;
  theHeight := self.Height;

  stopW.Reset;
  stopW.Start;
  try
    for I := 1 to maxLines do
    begin
       pt1.x := Random (theWitdh);
       pt1.y := Random (theHeight);
       pt2.x := Random (theWitdh);
       pt2.y := Random (theHeight);
       Canvas.Pen.Color := RGB (random (256), random (256), random (256));
       Canvas.DrawLine(pt1, pt2);
    end;
  finally
    stopW.Stop;
  end;
  Caption := IntToStr (stopW.ElapsedMilliseconds);
end;

procedure TForm2.WMPaint(var Message: TWMPaint);
var
  PaintStruct: TPaintStruct;
begin
  BeginPaint(Handle, PaintStruct);
  try
    FCanvas.BeginDraw;
    try
      Paint;
    finally
      FCanvas.EndDraw;
    end;
  finally
    EndPaint(Handle, PaintStruct);
  end;
end;

procedure TForm2.WMSize(var Message: TWMSize);
begin
  if Assigned(FCanvas) then
    ID2D1HwndRenderTarget(FCanvas.RenderTarget).Resize(D2D1SizeU(ClientWidth, ClientHeight));
  inherited;
end;

end.
