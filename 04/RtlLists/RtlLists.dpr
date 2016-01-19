program RtlLists;

uses
  Forms,
  RtlListsMainForm in 'RtlListsMainForm.pas' {FormRtlLists};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormRtlLists, FormRtlLists);
  Application.Run;
end.
