program FirstRestClient;

uses
  Forms,
  FirstRestClient_MainForm in 'FirstRestClient_MainForm.pas' {FormFirstRestClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFirstRestClient, FormFirstRestClient);
  Application.Run;
end.
