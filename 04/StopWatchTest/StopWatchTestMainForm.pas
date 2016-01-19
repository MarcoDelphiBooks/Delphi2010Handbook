unit StopWatchTestMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Registry, StdCtrls;

type
  TForm39 = class(TForm)
    Memo1: TMemo;
    btnTest: TButton;
    btnCondensed: TButton;
    procedure btnTestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCondensedClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

uses
  Diagnostics;

procedure TForm39.btnCondensedClick(Sender: TObject);
var
  sw: TStopWatch;
  I: Integer;
begin
  sw := TStopwatch.StartNew;
  for I := 0 to 999 do
    Caption := TimeToStr (Now);
  Log ('msec: ' + IntToStr (sw.ElapsedMilliseconds));
  Log ('ticks: ' + IntToStr (sw.ElapsedTicks));
end;

procedure TForm39.btnTestClick(Sender: TObject);
var
  sw: TStopWatch;
  I: Integer;
begin
  sw := TStopwatch.Create;
  sw.Start;
  for I := 0 to 999 do
    Caption := TimeToStr (Now);
  sw.Stop;
  Log ('msec: ' + IntToStr (sw.ElapsedMilliseconds));
  Log ('ticks: ' + IntToStr (sw.ElapsedTicks));
end;

procedure TForm39.FormCreate(Sender: TObject);
begin
  TStopwatch.IsHighResolution := True;
end;

procedure TForm39.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
