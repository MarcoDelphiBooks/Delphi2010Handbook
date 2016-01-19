unit DebugVisualMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btnUcs4Char: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnUcs4CharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

uses
  Character;

procedure TForm39.Button1Click(Sender: TObject);
var
  theTime: TDateTime;
begin
  theTime := Now;
  ShowMessage(TimeToStr(theTime));
end;

procedure TForm39.Button2Click(Sender: TObject);
var
  sl: TStringList;
  I: Integer;
begin
  sl := TStringList.Create;
  try
    for I := 1 to 10 do
        sl.Add(IntToStr (I));
    ShowMessage (sl.Text);
  finally
    sl.Free;
  end;
end;

procedure TForm39.btnUcs4CharClick(Sender: TObject);
var
  ch: UCS4Char;
begin
  ch := Ord ('ù');
  ShowMessage (Character.ConvertFromUtf32 (ch));
end;

end.
