program Win7Libraries;

uses
  Forms,
  Win7Libraries_MainForm in 'Win7Libraries_MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
