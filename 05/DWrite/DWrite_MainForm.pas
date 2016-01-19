unit DWrite_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormDWrite = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDWrite: TFormDWrite;

implementation

{$R *.dfm}

uses
  Direct2D, D2D1;

procedure TFormDWrite.FormPaint(Sender: TObject);
var
  strText: string;
  idwtFormat: IDWriteTextFormat;
  idwtLayout: IDWriteTextLayout;
  matrix: DWRITE_MATRIX;
  d2dCanvas: TDirect2DCanvas;
begin
  d2dCanvas := TDirect2DCanvas.Create(Canvas, ClientRect);
  d2dCanvas.BeginDraw;
  try
    d2dCanvas.Brush.Color := clBlack;
    DWriteFactory.CreateTextFormat('Arial', nil,
      DWRITE_FONT_WEIGHT_LIGHT, DWRITE_FONT_STYLE_NORMAL,
      DWRITE_FONT_STRETCH_SEMI_CONDENSED, 35, 'en-US', idwtFormat);
    strText := 'Hello, Delphi';
    d2dCanvas.RenderTarget.DrawText (PChar(strText),
      Length (strText), idwtFormat, Rect (10, 10, 500, 200),
      d2dCanvas.Brush.Handle);

    strText := 'This is a DirectWrite oblique example';
    DWriteFactory.CreateTextFormat('Arial', nil,
      DWRITE_FONT_WEIGHT_EXTRA_BOLD, DWRITE_FONT_STYLE_OBLIQUE,
      DWRITE_FONT_STRETCH_EXTRA_EXPANDED, 35, 'en-US', idwtFormat);
    idwtFormat.SetTextAlignment(DWRITE_TEXT_ALIGNMENT_CENTER);
    idwtFormat.SetLineSpacing(DWRITE_LINE_SPACING_METHOD_UNIFORM, 28, 0);

    d2dCanvas.RenderTarget.DrawText (PChar(strText),
      Length (strText), idwtFormat, Rect (10, 110, 500, 200),
      d2dCanvas.Brush.Handle);
  finally
    d2dCanvas.EndDraw;
    d2dCanvas.Free;
  end;
end;

end.
