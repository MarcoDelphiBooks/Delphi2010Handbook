unit DsnapMethodsClient_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormDsmcMain = class(TForm)
    btnNewForm: TButton;
    btnUpdateStatus: TButton;
    Memo1: TMemo;
    rgLifeCycle: TRadioGroup;
    btnStartServer: TButton;
    procedure btnNewFormClick(Sender: TObject);
    procedure btnUpdateStatusClick(Sender: TObject);
    procedure btnStartServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormDsmcMain: TFormDsmcMain;

implementation

uses DsnapMethodsClient_ClientForm;

{$R *.dfm}

procedure TFormDsmcMain.btnNewFormClick(Sender: TObject);
begin
  // create a client form, with a connection to the server
  with TFormDsmcClient.Create(Application) do
  begin
    Show;
  end;
end;

procedure TFormDsmcMain.btnStartServerClick(Sender: TObject);
var
  aStr: AnsiString;
begin
  Log (rgLifeCycle.Items[rgLifeCycle.ItemIndex]);
  aStr := 'DsnapMethodsServer.exe ' +
    rgLifeCycle.Items[rgLifeCycle.ItemIndex];
  WinExec (PAnsiChar (aStr), CmdShow);
end;

procedure TFormDsmcMain.btnUpdateStatusClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[I].ClassType = TFormDsmcClient then
      Log (IntToStr (I) + ': ' + Screen.Forms[I].ToString);
end;

procedure TFormDsmcMain.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
