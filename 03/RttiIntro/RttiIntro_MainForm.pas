unit RttiIntro_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormRttiIntro = class(TForm)
    btnInfo: TButton;
    Memo1: TMemo;
    btnChange: TButton;
    procedure btnInfoClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormRttiIntro: TFormRttiIntro;

implementation

{$R *.dfm}

uses
  Rtti;


procedure TFormRttiIntro.btnChangeClick(Sender: TObject);
var
  context: TRttiContext;
  aProp: TRttiProperty;
begin
  aProp := context.GetType(TButton).GetProperty('Caption');
  aProp.SetValue(btnChange, StringOfChar ('*', random (10) + 1));
end;

procedure TFormRttiIntro.btnInfoClick(Sender: TObject);
var
  context: TRttiContext;
begin
  Log (context.
    GetType(TButton).
    GetProperty('Caption').
    GetValue(Sender).ToString);
end;

procedure TFormRttiIntro.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
