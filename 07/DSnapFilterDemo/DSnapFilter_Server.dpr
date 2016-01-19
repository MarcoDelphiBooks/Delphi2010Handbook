program DSnapFilter_Server;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  DSnapFilter_ServerForm in 'DSnapFilter_ServerForm.pas' {Form1},
  DSnapFilter_ServerMethods in 'DSnapFilter_ServerMethods.pas',
  DSnapFilter_WebModule in 'DSnapFilter_WebModule.pas' {WebModule3: TWebModule},
  DSnapFilter64 in '..\DSnapFilter01\DSnapFilter64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule3, WebModule3);
  Application.Run;
end.

