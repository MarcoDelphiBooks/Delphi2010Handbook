unit ConsoleClient_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DbxDatasnap, DB, SqlExpr, FMTBcd, StdCtrls;

type
  TConsoleClientForm = class(TForm)
    FIRST: TSQLConnection;
    TServerMethods1_EchoString: TSQLDataSet;
    btnCallEcho: TButton;
    btnProxy: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCallEchoClick(Sender: TObject);
    procedure btnProxyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsoleClientForm: TConsoleClientForm;

implementation

{$R *.dfm}

uses
  DSHTTPLayer, ClientProxy;

procedure TConsoleClientForm.btnCallEchoClick(Sender: TObject);
begin
  TServerMethods1_EchoString.
    ParamByName('Value').AsString := 'Hello ' + TimeToStr (Now);
  TServerMethods1_EchoString.ExecSQL;
  ShowMessage (TServerMethods1_EchoString.
    ParamByName('ReturnParameter').AsString);
end;

procedure TConsoleClientForm.btnProxyClick(Sender: TObject);
begin
  with TServerMethods1Client.Create(FIRST.DBXConnection) do
  try
    ShowMessage (EchoString('Hello ' + TimeToStr (Now)))
  finally
    Free;
  end;
end;

procedure TConsoleClientForm.FormCreate(Sender: TObject);
begin
  FIRST.Open;
end;

end.
