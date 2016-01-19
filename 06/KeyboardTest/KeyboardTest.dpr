program KeyboardTest;

uses
  Forms,
  KeyboardTest_MainForm in 'KeyboardTest_MainForm.pas' {KeyboardForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TKeyboardForm, KeyboardForm);
  Application.Run;
end.
