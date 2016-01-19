program EditGestures;

uses
  Forms,
  EditGestures_MainForm in 'EditGestures_MainForm.pas' {FormEditGest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEditGest, FormEditGest);
  Application.Run;
end.
