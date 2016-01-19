program First3TierHttp_Server;

uses
  Forms,
  First3TierHttp_ServerMainForm in 'First3TierHttp_ServerMainForm.pas' {FormFirst3Tier2009Server},
  First3TierHttp_ServerModule in 'First3TierHttp_ServerModule.pas' {DSFirst3TierServerModule: TDSServerModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFirst3Tier2009Server, FormFirst3Tier2009Server);
  Application.CreateForm(TDSFirst3TierServerModule, DSFirst3TierServerModule);
  Application.Run;
end.
