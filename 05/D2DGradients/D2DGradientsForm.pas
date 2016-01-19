unit D2DGradientsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Direct2D;

type
  TFormGradients = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    d2dCanvas: TDirect2DCanvas;
  protected
    procedure CreateWnd; override;
  end;

var
  FormGradients: TFormGradients;

implementation

{$R *.dfm}

uses
  D2D1;

procedure TFormGradients.CreateWnd;
begin
  inherited;
  d2dCanvas := TDirect2DCanvas.Create(Handle);
end;

procedure TFormGradients.FormCreate(Sender: TObject);
begin
  if not TDirect2DCanvas.Supported then
    raise Exception.Create('Direct2D not supported!');
end;

procedure TFormGradients.FormDestroy(Sender: TObject);
begin
  d2dCanvas.Free;
end;

procedure TFormGradients.FormPaint(Sender: TObject);
var
  gradColors: array of TColor;
  Center: TD2D1Point2F;
  strText: string;
  matrix, defMatrix: TD2DMatrix3x2F;
  I: Integer;
begin
  d2dCanvas.BeginDraw;
  try
    d2dCanvas.RenderTarget.GetTransform (defMatrix);

    // define the gradient colors
    SetLength (gradColors, 4);
    gradColors [0] := clBlue;
    gradColors [1] := clAqua;
    gradColors [2] := clNavy;
    gradColors [3] := clFuchsia;

    // create the gradient brush, using colors and points
    Center := D2D1PointF (100, 100);
    d2dCanvas.Brush.Handle :=
      d2dCanvas.CreateBrush (gradColors, Center,
      D2D1PointF (300, 200), 900, 900);

    // paint the entire form with the gradient brush
    d2dCanvas.Rectangle(0, 0, ClientWidth + 50, ClientHeight + 50);

    // define a font with a gradient brush
    d2dCanvas.Font.Size := 60;
    d2dCanvas.Font.Brush.Handle :=
      d2dCanvas.CreateBrush (gradColors, Center,
        D2D1PointF (300, 300), 550, 650);;
    d2dCanvas.Font.Style := [fsBold];
    d2dCanvas.Brush.Style := bsClear;

    // output some text with the current font
    strText := 'Delphi 2010';
    d2dCanvas.TextOut(200, 100, strText);

    for I := 1 to 10 do
    begin
      D2D1MakeRotateMatrix (I * 6, D2D1PointF(50, 50), @matrix);
      d2dCanvas.RenderTarget.SetTransform(matrix);
      d2dCanvas.Font.Brush.Handle.SetOpacity(1 - I * 0.1);
      d2dCanvas.TextOut(200, 100, strText);
    end;
    // reset standard transformation
    d2dCanvas.RenderTarget.SetTransform (defMatrix);
  finally
    d2dCanvas.EndDraw;
  end;
end;

procedure TFormGradients.FormResize(Sender: TObject);
begin
  if Assigned(d2dCanvas) then
    (d2dCanvas.RenderTarget as ID2D1HwndRenderTarget).
      Resize(D2D1SizeU(ClientWidth, ClientHeight));
end;

end.
