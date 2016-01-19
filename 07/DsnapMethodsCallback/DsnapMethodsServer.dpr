program DsnapMethodsServer;

uses
  Forms,
  DsnapMethodsServer_MainForm in 'DsnapMethodsServer_MainForm.pas' {FormDsnapMethodsServer};

{$R *.res}

begin
  if ParamCount > 0 then
    ParamLifeCycle := ParamStr(1);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDsnapMethodsServer, FormDsnapMethodsServer);
  Application.Run;
end.
