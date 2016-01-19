program DWrite;

uses
  Forms,
  DWrite_MainForm in 'DWrite_MainForm.pas' {FormDWrite};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDWrite, FormDWrite);
  Application.Run;
end.
