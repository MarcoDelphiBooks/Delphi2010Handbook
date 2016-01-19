program TiffViewer;

uses
  Forms,
  TiffViewer_MainForm in 'TiffViewer_MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
