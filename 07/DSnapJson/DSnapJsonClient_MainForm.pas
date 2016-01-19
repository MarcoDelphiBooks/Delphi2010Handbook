unit DSnapJsonClient_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, DSnapJsonClient_Proxy, DSnapJson_MyData,
  DbxDatasnap, StdCtrls;

type
  TFormJsonClient = class(TForm)
    SQLConnection1: TSQLConnection;
    btnValue: TButton;
    btnArray: TButton;
    btnMarshal: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnValueClick(Sender: TObject);
    procedure btnArrayClick(Sender: TObject);
    procedure btnMarshalClick(Sender: TObject);
  private
    MethodsProxi: TDSnapJsonMethodsClient;
  public
    procedure Log (const strMsg: string);
  end;

var
  FormJsonClient: TFormJsonClient;

implementation

{$R *.dfm}

uses
  DBXJSON, DBXJSONReflect;

procedure TFormJsonClient.btnMarshalClick(Sender: TObject);
var
  jValue: TJSONValue;
  jUnmarshal: TJSONUnMarshal;
  myData: TMyData;
begin
  jValue := MethodsProxi.GetData('joe');
  jUnmarshal := TJSONUnMarshal.Create;
  try
    myData := jUnmarshal.Unmarshal(jValue) as TMyData;
    try
      Log (myData.ToString);
    finally
      myData.Free;
    end;
  finally
    jUnmarshal.Free;
  end;
end;

procedure TFormJsonClient.btnValueClick(Sender: TObject);
var
  jValue: TJSONValue;
begin
  jValue := MethodsProxi.SimpleValue;
  Log (jValue.ToString);
  // the proxi becomes the TJSONValue instrance owner
end;

procedure TFormJsonClient.btnArrayClick(Sender: TObject);
var
  jArray: TJSONArray;
begin
  jArray := MethodsProxi.GetList(5);
  Log (jArray.ToString);
end;

procedure TFormJsonClient.FormCreate(Sender: TObject);
begin
  SQLConnection1.Open;
  MethodsProxi := TDSnapJsonMethodsClient.Create(
    SQLConnection1.DBXConnection);
end;

procedure TFormJsonClient.FormDestroy(Sender: TObject);
begin
  SQLConnection1.Close;
  MethodsProxi.Free;
end;

procedure TFormJsonClient.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
