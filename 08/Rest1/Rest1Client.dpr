program Rest1Client;

uses
  Forms,
  Rest1Client_MainForm in 'Rest1Client_MainForm.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
