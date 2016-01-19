program Rest1;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  Rest1_MainForm in 'Rest1_MainForm.pas' {Form1},
  Rest1_WebModule in 'Rest1_WebModule.pas' {WebModule3: TWebModule},
  TrivialXmlWriter in 'TrivialXmlWriter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule3, WebModule3);
  Application.Run;
end.

