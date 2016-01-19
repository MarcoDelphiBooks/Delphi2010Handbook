program FileAccessThemed;

uses
  Forms,
  FileAccessForm in 'FileAccessForm.pas' {FormFile};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFile, FormFile);
  Application.Run;
end.
