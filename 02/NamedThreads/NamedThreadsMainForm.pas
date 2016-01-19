unit NamedThreadsMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFormNamedThreads = class(TForm)
    btnCreate: TButton;
    btnTerminate: TButton;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure btnCreateClick(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MyThreadTerminated(Sender: TObject);
  public
    procedure Log (const strMsg: string);
  end;

var
  FormNamedThreads: TFormNamedThreads;

implementation

uses MyThreadClass;

{$R *.dfm}

var
  aGlobalThread: TMyThread;

procedure TFormNamedThreads.btnCreateClick(Sender: TObject);
begin
  if not Assigned (aGlobalThread) then
  begin
    aGlobalThread := TMyThread.Create (False);
    aGlobalThread.OnTerminate := MyThreadTerminated;
  end;
end;

procedure TFormNamedThreads.btnTerminateClick(Sender: TObject);
begin
  if Assigned (aGlobalThread) then
    aGlobalThread.Terminate;
end;

procedure TFormNamedThreads.FormCreate(Sender: TObject);
begin
  TThread.NameThreadForDebugging('Main');
end;

procedure TFormNamedThreads.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

procedure TFormNamedThreads.MyThreadTerminated(Sender: TObject);
begin
  aGlobalThread := nil;
end;

procedure TFormNamedThreads.Timer1Timer(Sender: TObject);
begin
  Log ('Main: ' + CurrentTimeAsStr);
end;

end.
