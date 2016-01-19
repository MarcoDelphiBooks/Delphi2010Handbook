program FirstSimpleRestServer;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  Fsrs_MainForm in 'Fsrs_MainForm.pas' {Form1},
  Fsrs_ServerClass in 'Fsrs_ServerClass.pas' {ServerMethods1: TDSServerModule},
  Fsrs_DataModule in 'Fsrs_DataModule.pas' {WebModule2: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerMethods1, ServerMethods1);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.

