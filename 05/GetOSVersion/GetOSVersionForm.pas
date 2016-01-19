unit GetOSVersionForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm8 = class(TForm)
    btnGetVersion: TButton;
    Memo1: TMemo;
    procedure btnGetVersionClick(Sender: TObject);
  private
    { Private declarations }
  public
   procedure Log (const strMsg: string);
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

function IsVista: Boolean;
begin
  Result := lobyte(loword (GetVersion)) = 6;
end;

procedure TForm8.btnGetVersionClick(Sender: TObject);
begin
  Log ('IsVista: ' + BoolToStr (IsVista, True));
  Log ('Win32MajorVersion: ' + IntToStr(Win32MajorVersion));
  Log ('Win32MinorVersion: ' + IntToStr(Win32MinorVersion));
  Log ('Win32BuildNumber: ' + IntToStr(Win32BuildNumber));
  // any use?
  // Memo1.Lines.Add ('Win32CSDVersion: ' +  Win32CSDVersion);
  if CheckWin32Version(6) then
    Log ('Running at least on Vista');
  if CheckWin32Version(6, 1) then
    Log ('Running on 7');
end;

procedure TForm8.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
