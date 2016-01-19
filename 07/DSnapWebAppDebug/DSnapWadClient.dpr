program DSnapWadClient;

uses
  Forms,
  DSnapWadClient_MainForm in 'DSnapWadClient_MainForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
