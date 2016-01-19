program First3TierHttp_Client;

uses
  Forms,
  First3TierHttp_ClientMainForm in 'First3TierHttp_ClientMainForm.pas' {FormFirst3Tier2009Client},
  First3TierHttp_ClientClasses in 'First3TierHttp_ClientClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFirst3Tier2009Client, FormFirst3Tier2009Client);
  Application.Run;
end.
