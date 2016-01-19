program DSnapJsonServer;

uses
  Forms,
  DSnapJsonServer_MainForm in 'DSnapJsonServer_MainForm.pas' {Form1},
  DSnapJsonServer_Methods in 'DSnapJsonServer_Methods.pas',
  DSnapJsonServer_Container in 'DSnapJsonServer_Container.pas' {ServerContainer1: TDataModule},
  DSnapJson_MyData in 'DSnapJson_MyData.pas',
  DSnapJsonClient_Proxy in 'DSnapJsonClient_Proxy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.




