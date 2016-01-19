program TypesList;

uses
  Forms,
  TypesListMainForm in 'TypesListMainForm.pas' {FormTypesList},
  TypeInfoForm in 'TypeInfoForm.pas' {FormTypeInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTypesList, FormTypesList);
  Application.Run;
end.
