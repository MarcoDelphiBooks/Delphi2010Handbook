program CustomGestureTest;

uses
  Forms,
  CustomGestureTest_MainForm in 'CustomGestureTest_MainForm.pas' {CustomGestureForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCustomGestureForm, CustomGestureForm);
  Application.Run;
end.
