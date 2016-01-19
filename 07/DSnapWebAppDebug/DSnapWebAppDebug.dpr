program DSnapWebAppDebug;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  DSnapWebAppMainForm in 'DSnapWebAppMainForm.pas' {Form1},
  DSnapServerMethods in 'DSnapServerMethods.pas' {ServerMethods1: TDSServerModule},
  DSnapWebAppModule in 'DSnapWebAppModule.pas' {WebModule2: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerMethods1, ServerMethods1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.

