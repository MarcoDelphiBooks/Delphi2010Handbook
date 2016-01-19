unit MoveIPMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

procedure TForm39.Button1Click(Sender: TObject);
var
  X, Y: Integer;
begin
  X := 100;
  Y := 50;
  Left := X;
  Top := Y;
  X := X + Y;
  (Sender as TButton).Caption := IntToStr (X);
end;

procedure TForm39.FormClick(Sender: TObject);
begin
  Left := 10;
end;

end.
