program D2DLinesSpeed;

uses
  Forms,
  D2DLinesSpeed_MainForm in 'D2DLinesSpeed_MainForm.pas' {Form1},
  D2DLinesSpeed_Direct2DOnly in 'D2DLinesSpeed_Direct2DOnly.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
