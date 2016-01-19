program DsnapMethodsClient;

uses
  Forms,
  DsnapMethodsClient_ClientForm in 'DsnapMethodsClient_ClientForm.pas' {FormDsmcClient},
  DsnapMethodsClient_MainForm in 'DsnapMethodsClient_MainForm.pas' {FormDsmcMain},
  DsnapMethodsClient_Proxy in 'DsnapMethodsClient_Proxy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDsmcMain, FormDsmcMain);
  Application.Run;
end.
