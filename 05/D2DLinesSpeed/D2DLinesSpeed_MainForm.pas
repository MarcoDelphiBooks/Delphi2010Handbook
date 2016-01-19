unit D2DLinesSpeed_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Diagnostics, Direct2D, D2D1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    stopW: TStopwatch;
    aGDIForm: TForm;
    d2dCanvas: TDirect2DCanvas;
    a2DForm: TForm;
    procedure D2DPaint(Sender: TObject);
    procedure GDIPaint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  D2DLinesSpeed_Direct2DOnly;

const
  maxLines = 100000; // fifty thousand

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not Assigned(aGDIForm) then
  begin
    aGDIForm := TForm.Create(self);
    aGDIForm.Width := 300;
    aGDIForm.Height := 300;
    aGDIForm.OnPaint := GDIPaint;
    aGDIForm.Show;
  end
  else
    aGDIForm.Repaint;
end;

procedure TForm1.GDIPaint (Sender: TObject);
var
  I: Integer;
  pt1, pt2: TPoint;
  theWitdh, theHeight: Integer;
  aForm: TForm;
begin
  aForm := Sender as TForm;
  theWitdh := aForm.ClientWidth;
  theHeight := aForm.ClientHeight;

  stopW.Reset;
  stopW.Start;
  for I := 1 to maxLines do
  begin
     pt1.x := Random (theWitdh);
     pt1.y := Random (theHeight);
     pt2.x := Random (theWitdh);
     pt2.y := Random (theHeight);
     aForm.Canvas.Pen.Color := RGB (random (256), random (256), random (256));
     aForm.Canvas.MoveTo(pt1.X, pt1.y);
     aForm.Canvas.LineTo(pt2.X, pt2.y);
  end;
  stopW.Stop;
  aForm.Caption := IntToStr (stopW.ElapsedMilliseconds);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(a2DForm) then
  begin
    a2DForm := TForm.Create(self);
    a2DForm.Width := 300;
    a2DForm.Height := 300;
    d2dCanvas := TDirect2DCanvas.Create(a2DForm.Handle);
    a2DForm.OnPaint := D2DPaint;
    a2DForm.Show;
  end
  else
    a2DForm.Repaint;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  TForm2.Create (self);
end;

procedure TForm1.D2DPaint (Sender: TObject);
var
  I: Integer;
  pt1, pt2: TD2DPoint2f;
  theWitdh, theHeight: Integer;
  aForm: TForm;
begin
  aForm := Sender as TForm;
  theWitdh := aForm.ClientWidth;
  theHeight := aForm.ClientHeight;

    //  Canvas, Rect (0, 0, theWitdh, theHeight));
  d2dCanvas.BeginDraw;
  stopW.Reset;
  stopW.Start;
  try
    for I := 1 to maxLines do
    begin
       pt1.x := Random (theWitdh);
       pt1.y := Random (theHeight);
       pt2.x := Random (theWitdh);
       pt2.y := Random (theHeight);
       d2dCanvas.Pen.Color := RGB (random (256), random (256), random (256));
       d2dCanvas.DrawLine(pt1, pt2);
    end;
  finally
    stopW.Stop;
    d2dCanvas.EndDraw;
  end;
  aForm.Caption := IntToStr (stopW.ElapsedMilliseconds);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  stopW := TStopwatch.Create;
end;

end.
