program DSnapFilter_Client;

uses
  Forms,
  DSnapFilter_ClientForm in 'DSnapFilter_ClientForm.pas' {Form3},
  DSnapFilter64 in '..\DSnapFilter01\DSnapFilter64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
