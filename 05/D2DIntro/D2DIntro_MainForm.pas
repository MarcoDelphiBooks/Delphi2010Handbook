unit D2DIntro_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TD2DForm = class(TForm)
    PopupMenu1: TPopupMenu;
    FromCanvas1: TMenuItem;
    FormHandle1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FromCanvas1Click(Sender: TObject);
    procedure FormHandle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fUseCanvas: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  D2DForm: TD2DForm;

implementation

{$R *.dfm}

uses
  Direct2d, D2D1;

procedure TD2DForm.FormCreate(Sender: TObject);
begin
  fUseCanvas := True;
end;

procedure TD2DForm.FormHandle1Click(Sender: TObject);
begin
  fUseCanvas := False;
  Invalidate;
end;

procedure TD2DForm.FormPaint(Sender: TObject);
var
  d2dCanvas: TDirect2DCanvas;
  I: Integer;
begin
  if fUseCanvas then
    // end up calling CreateDCRenderTarget:
    // "Creates a render target that draws to a Windows Graphics Device
    // Interface (GDI) device context."
    d2dCanvas := TDirect2DCanvas.Create(Canvas, ClientRect)
  else
    // end up calling CreateHwndRenderTarget:
    // "Creates an ID2D1HwndRenderTarget, a render target that renders
    // to a window."
    d2dCanvas := TDirect2DCanvas.Create(Handle);
  d2dCanvas.BeginDraw;
  try
    d2dCanvas.Brush.Color := clRed;
    d2dCanvas.Pen.Color := clBlue;
    for I := 1 to 10 do
    begin
      d2dCanvas.Brush.Handle.SetOpacity(0.1 * I);
      d2dCanvas.Ellipse(10 + I * 20, 10 + I * 20,
        500 - I * 20, 500 - I * 20);
    end;
  finally
    d2dCanvas.EndDraw;
    d2dCanvas.Free;
  end;
end;

procedure TD2DForm.FromCanvas1Click(Sender: TObject);
begin
  fUseCanvas := True;
  Invalidate;
end;

end.
