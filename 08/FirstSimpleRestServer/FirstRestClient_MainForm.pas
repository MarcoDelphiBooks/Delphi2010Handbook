unit FirstRestClient_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls;

type
  TFormFirstRestClient = class(TForm)
    IdHTTP1: TIdHTTP;
    btnPlainCall: TButton;
    btnToJSON: TButton;
    edInput: TEdit;
    procedure btnPlainCallClick(Sender: TObject);
    procedure btnToJSONClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFirstRestClient: TFormFirstRestClient;

implementation

{$R *.dfm}

uses
  DBXJSON;

const
  strServerUrl = 'http://localhost:8081/FirstSimpleRestServer.FirstSimpleRestServer/';
  strMethodUrl = 'datasnap/rest/TServerMethods1/EchoString/';

procedure TFormFirstRestClient.btnPlainCallClick(Sender: TObject);
var
  strParam: string;
begin
  strParam := edInput.Text;
  ShowMessage (IdHTTP1.Get(strServerUrl + strMethodUrl + strParam));
end;

procedure TFormFirstRestClient.btnToJSONClick(Sender: TObject);
var
  strParam, strHttpResult, strResult: string;
  jValue: TJSONValue;
  jObj: TJSONObject;
  jPair: TJSONPair;
  jArray: TJSOnArray;
begin
  strParam := edInput.Text;
  strHttpResult := IdHTTP1.Get(strServerUrl + strMethodUrl + strParam);
  jValue := TJSONObject.ParseJSONValue(
    TEncoding.ASCII.GetBytes(strHttpResult), 0);
  if not Assigned (jValue) then
  begin
    ShowMessage ('Error in parsing ' + strHttpResult);
    Exit;
  end;

  try
    jObj := jValue as TJSONObject;
    jPair := jObj.Get(0); // get the first and only JSON pair
    jArray := jPair.JsonValue as TJsonArray; // the pair value is an array
    strResult := jArray.Get(0).Value; // value of first and only element of array

    ShowMessage ('The response is: ' + strResult);
  finally
    jObj.Free;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
