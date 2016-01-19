program DataGestures;

uses
  Forms,
  DataGestures_MainForm in 'DataGestures_MainForm.pas' {DataGesturesForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataGesturesForm, DataGesturesForm);
  Application.Run;
end.
