program D2DIntro;

uses
  Forms,
  D2DIntro_MainForm in 'D2DIntro_MainForm.pas' {D2DForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TD2DForm, D2DForm);
  Application.Run;
end.
