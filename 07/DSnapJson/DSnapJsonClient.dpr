program DSnapJsonClient;

uses
  Forms,
  DSnapJsonClient_MainForm in 'DSnapJsonClient_MainForm.pas' {FormJsonClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormJsonClient, FormJsonClient);
  Application.Run;
end.
