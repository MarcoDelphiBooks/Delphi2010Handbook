program D2DGradients;

uses
  Forms,
  D2DGradientsForm in 'D2DGradientsForm.pas' {FormGradients};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGradients, FormGradients);
  Application.Run;
end.
