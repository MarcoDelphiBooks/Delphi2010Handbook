program D2DCanvasMix;

uses
  Forms,
  D2DCanvasMix_MainForm in 'D2DCanvasMix_MainForm.pas' {FormMix};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMix, FormMix);
  Application.Run;
end.
