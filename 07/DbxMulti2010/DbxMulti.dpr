program DbxMulti;

uses
  Forms,
  DbxMultiForm in 'DbxMultiForm.pas' {Form1},
  Grids in 'Grids.pas',
  DbGridFix in 'DbGridFix.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
