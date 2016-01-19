program DataRestServer;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  DataRestServer_MainForm in 'DataRestServer_MainForm.pas' {Form1},
  DataRestServer_ServerClass in 'DataRestServer_ServerClass.pas' {ServerData: TDataModule},
  DataRestServer_WebModule in 'DataRestServer_WebModule.pas' {WebModule2: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerData, ServerData);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.

