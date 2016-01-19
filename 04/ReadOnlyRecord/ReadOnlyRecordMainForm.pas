unit ReadOnlyRecordMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

type
  TMyPoint = record
    X: Integer;
    Y: Integer;
  end;

  TMyFixedRect = class
  private
    fBottomRight: TMyPoint;
    fTopLeft: TMyPoint;
  public
    constructor Create (a, b, c, d: Integer);
    property TopLeft: TMyPoint read fTopLeft;
    property BottomRight: TMyPoint read fBottomRight;
  end;

procedure TForm39.Button1Click(Sender: TObject);
var
  aRect: TMyFixedRect;
  aPoint: TMyPoint;
begin
  aRect := TMyFixedRect.Create(10, 10, 100, 100);
  ShowMessage (IntToStr (aRect.TopLeft.X));
  // aRect.TopLeft.X := 20;
  with aRect.TopLeft do
    X := 20;              // this fails to compile in Delphi 2010!
  aPoint := aRect.TopLeft;
  aPoint.X := 20;
  ShowMessage (IntToStr (aRect.TopLeft.X));
end;

{ TMyFixedRect }

constructor TMyFixedRect.Create(a, b, c, d: Integer);
begin
  fTopLeft.X := a;
  fTopLeft.Y := b;
  fBottomRight.X := c;
  fBottomRight.Y := d;
end;

end.
