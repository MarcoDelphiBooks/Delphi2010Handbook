program XmlPersist;

uses
  Forms,
  XmlPersistPublish_MainForm in 'XmlPersistPublish_MainForm.pas' {Form1},
  XmlPersistPublish_Classes in 'XmlPersistPublish_Classes.pas',
  TrivialXmlWriter in 'TrivialXmlWriter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
