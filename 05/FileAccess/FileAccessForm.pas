unit FileAccessForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormFile = class(TForm)
    Memo1: TMemo;
    btnSaveRoot: TButton;
    btnSaveLocal: TButton;
    btnLoadLocal: TButton;
    btnSaveDocs: TButton;
    btnLoadDocs: TButton;
    btnUAC: TButton;
    procedure btnSaveRootClick(Sender: TObject);
    procedure btnLoadLocalClick(Sender: TObject);
    procedure btnSaveDocsClick(Sender: TObject);
    procedure btnLoadDocsClick(Sender: TObject);
    procedure btnSaveLocalClick(Sender: TObject);
    procedure btnUACClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFile: TFormFile;

implementation

{$R *.dfm}

uses
  SHFolder, ShellAPI;

const
  TOKEN_DEFAULTUSER = $FFFF; // -1

procedure TFormFile.btnLoadDocsClick(Sender: TObject);
var
  szBuffer: string;
begin
  SetLength (szBuffer, 250);
  ShGetFolderPath (Handle, CSIDL_PERSONAL, TOKEN_DEFAULTUSER, 0, PChar(szBuffer));
  szBuffer := PChar(szBuffer);
  ShowMessage (szBuffer + '\SomeText.txt');
  Memo1.Lines.LoadFromFile (szBuffer + '\SomeText.txt');
end;

procedure TFormFile.btnLoadLocalClick(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile (
    ExtractFilePath (Application.Exename) +
    'SomeText.txt');
end;

procedure TFormFile.btnSaveDocsClick(Sender: TObject);
var
  szBuffer: string;
begin
  SetLength (szBuffer, 250);
  ShGetFolderPath (Handle, CSIDL_PERSONAL, TOKEN_DEFAULTUSER, 0,
    PChar(szBuffer));
  szBuffer := PChar(szBuffer);
  ShowMessage (szBuffer + '\SomeText.txt');
  Memo1.Lines.SaveToFile (szBuffer + '\SomeText.txt');
end;

procedure TFormFile.btnSaveLocalClick(Sender: TObject);
begin
  Dialogs.UseLatestCommonDialogs := False;
  Memo1.Lines.SaveToFile (
    ExtractFilePath (Application.Exename) +
    'SomeText.txt');
end;

procedure TFormFile.btnSaveRootClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile ('C:\SomeText.txt');
end;

// begin of code borrowed from Fredrik Haglund

procedure RunAsAdmin(hWnd: HWND; aFile: string; aParameters: string);
var
  sei: TShellExecuteInfo;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := sizeof(sei);
  sei.Wnd := hWnd;
  sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
  sei.lpVerb := 'runas';
  sei.lpFile := PChar(aFile);
  sei.lpParameters := PChar(aParameters);
  sei.nShow := SW_SHOWNORMAL;
  if not ShellExecuteEx(@sei) then
    RaiseLastOSError;
end;

const
  BCM_FIRST = $1600; // Button control messages
  BCM_SETSHIELD = BCM_FIRST + $000C;

procedure SetElevationRequiredState(
  aControl: TWinControl; Required: Boolean);
var
  lRequired: Integer;
begin
  lRequired := Integer (Required);
  SendMessage(aControl.Handle, BCM_SETSHIELD, 0, lRequired);
end;

// end of code borrowed from Fredrik Haglund

procedure TFormFile.btnUACClick(Sender: TObject);
var
  strParams: string;
begin
  strParams := 'SomeText.txt C:\SomeText.txt';
  RunAsAdmin(Handle, ExtractFilepath (Application.ExeName) + 'FileAccessCopy.exe', strParams);
end;

procedure TFormFile.FormCreate(Sender: TObject);
begin
  SetElevationRequiredState (btnUAC, True);
end;

end.
