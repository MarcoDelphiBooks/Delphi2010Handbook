program DSnapGateway;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  DSnapGateway_ServerForm in 'DSnapGateway_ServerForm.pas' {Form1},
  DSnapGateway_WebModule in 'DSnapGateway_WebModule.pas' {WebModule3: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWebModule3, WebModule3);
  Application.Run;
end.

