program Win7Taskbar;

uses
  Forms,
  Win7Taskbar_MainForm in 'Win7Taskbar_MainForm.pas' {Win7TaskForm},
  TaskbarSupportUnit in 'TaskbarSupportUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWin7TaskForm, Win7TaskForm);
  Application.Run;
end.
