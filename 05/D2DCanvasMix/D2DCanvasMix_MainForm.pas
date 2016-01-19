unit D2DCanvasMix_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFormMix = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMix: TFormMix;

implementation

{$R *.dfm}

uses
  Direct2D, D2D1;

procedure TFormMix.FormPaint(Sender: TObject);
var
  d2dCanvas: TDirect2DCanvas;
begin
  d2dCanvas := TDirect2DCanvas.Create(Canvas,
    Rect (0, 0, Width, Height));
    // limited surface
    // Rect (0, 0, Width div 2, Height));

  d2dCanvas.BeginDraw;
  try
    d2dCanvas.Brush.Color := clWhite;
    d2dCanvas.Pen.Color := clBlack;
    d2dCanvas.Ellipse(100, 100, Width div 2, Height - 100);
    d2dCanvas.DrawLine(
      D2D1PointF(100, 100),
      D2D1PointF(Width - 100, Height - 100));
  finally
    d2dCanvas.EndDraw;
    d2dCanvas.Free;
  end;

  Canvas.Ellipse(Width div 2, 100, Width - 100, Height - 100);
  Canvas.MoveTo (110, 110);
  Canvas.LineTo (Width - 90, Height - 90);
end;

procedure TFormMix.FormResize(Sender: TObject);
begin
  Invalidate;
end;

end.
