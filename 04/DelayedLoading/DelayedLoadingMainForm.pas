unit DelayedLoadingMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    btnCall: TButton;
    procedure btnCallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

procedure TForm39.btnCallClick(Sender: TObject);
var
  aPoint: TPoint;
  hwnd: THandle;
begin
  aPoint := Point (100, 100);
  if CheckWin32Version (6, 0) then
  begin
    hwnd := WindowFromPhysicalPoint (aPoint);
    ShowMessage (IntToStr (hwnd));
  end;
end;

end.
