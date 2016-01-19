program NamedThreads;

uses
  Forms,
  NamedThreadsMainForm in 'NamedThreadsMainForm.pas' {FormNamedThreads},
  MyThreadClass in 'MyThreadClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormNamedThreads, FormNamedThreads);
  Application.Run;
end.
