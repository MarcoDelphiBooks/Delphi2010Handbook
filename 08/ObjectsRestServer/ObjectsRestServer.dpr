program ObjectsRestServer;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  ObjectsRestServer_MainForm in 'ObjectsRestServer_MainForm.pas' {Form1},
  ObjectsRestServer_Classes in 'ObjectsRestServer_Classes.pas',
  ObjectsRestServer_WebModule in 'ObjectsRestServer_WebModule.pas' {WebModule2: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.

