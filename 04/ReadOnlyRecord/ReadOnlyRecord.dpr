program ReadOnlyRecord;

uses
  Forms,
  ReadOnlyRecordMainForm in 'ReadOnlyRecordMainForm.pas' {Form39};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm39, Form39);
  Application.Run;
end.
