program InertiaBall;

uses
  Forms,
  InertiaBall_MainForm in 'InertiaBall_MainForm.pas' {InertiaForm},
  InertiaBall_TheBall in 'InertiaBall_TheBall.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TInertiaForm, InertiaForm);
  Application.Run;
end.
