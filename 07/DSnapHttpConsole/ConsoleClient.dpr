program ConsoleClient;

uses
  Forms,
  ConsoleClient_MainForm in 'ConsoleClient_MainForm.pas' {ConsoleClientForm},
  ClientProxy in 'ClientProxy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConsoleClientForm, ConsoleClientForm);
  Application.Run;
end.
