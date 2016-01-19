unit TiffViewer_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Wincodec{, jpeg};

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenDialog1.Filename);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  wicImg: TWICImage;
  wicBitmap: IWICBitmap;
  iFlipRot: IWICBitmapFlipRotator;
  iBmpSource: IWICBitmapSource;
  puiWidth, puiHeight: UINT;
  puiWidth2, puiHeight2: UINT;
begin
  if Image1.Picture.Graphic is TWICImage then
  begin
    wicImg := TWICImage (Image1.Picture.Graphic);

    iBmpSource := wicImg.Handle as IWICBitmapSource;
    iBmpSource.GetSize(puiWidth, puiHeight);
    Log ('Original: ' + IntToStr (puiWidth) + '/' + IntToStr (puiHeight));

    wicImg.ImagingFactory.CreateBitmapFlipRotator(iFlipRot);
    iFlipRot.Initialize (iBmpSource, WICBitmapTransformRotate90);
    iFlipRot.GetSize(puiWidth2, puiHeight2);
    Log ('Rotated: ' + IntToStr (puiWidth2) + '/' + IntToStr (puiHeight2));

    wicImg.ImagingFactory.CreateBitmapFromSourceRect(iFlipRot,
      0, 0, puiWidth2, puiHeight2, wicBitmap);
    if Assigned (wicBitmap) then
      wicImg.Handle := wicBitmap;
    Image1.Repaint;
  end;
end;

procedure TForm1.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  TPicture.RegisterFileFormat ('jpg', 'JPEG Image', TWICImage);

end.
