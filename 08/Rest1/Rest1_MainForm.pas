unit Rest1_MainForm;

interface

uses
  SysUtils, Classes, Forms;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SockApp;

{$R *.dfm}

initialization
  TWebAppSockObjectFactory.Create('rest1')

end.

