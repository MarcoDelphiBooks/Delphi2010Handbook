unit DSnapJsonServer_Methods;

interface

uses
  SysUtils, Classes, DSServer, DBXJSON;

type
{$METHODINFO ON}
  TDSnapJsonMethods = class(TPersistent)
  private
    { Private declarations }
  public
    function SimpleValue: TJSONValue;
    function GetList (nElem: Integer): TJSONArray;
    function GetData (const strName: string): TJSONValue;
  end;
{$METHODINFO OFF}

implementation

uses
  DsnapJson_MyData, DBXJSONReflect;

{ TDSnapJsonMethods }

function TDSnapJsonMethods.GetData(const strName: string): TJSONValue;
var
  myData: TMyData;
  jMarshal: TJSONMarshal;
begin
  myData := TMyData.Create(strName);
  try
    jMarshal := TJSONMarshal.Create(TJSONConverter.Create);
    try
      Result := jMarshal.Marshal(myData);
    finally
      jMarshal.Free;
    end;
  finally
    myData.Free;
  end;
end;

function TDSnapJsonMethods.GetList(nElem: Integer): TJSONArray;
var
  I: Integer;
begin
  Result := TJSONArray.Create;
  for I := 1 to nElem do
    Result.Add('Item ' + IntTOStr (I));
end;

function TDSnapJsonMethods.SimpleValue: TJSONValue;
begin
  Result := TJSONObject.Create (
    TJSONPair.Create ('name', 'Marco'));
  (Result as TJSONObject).AddPair(
    TJSONPair.Create ('email', 'marco@marcocantu.com'));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.




