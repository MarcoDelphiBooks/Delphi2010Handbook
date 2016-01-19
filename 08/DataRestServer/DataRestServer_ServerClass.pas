unit DataRestServer_ServerClass;

interface

uses
  SysUtils, Classes, DSServer, DB, DBClient, dbxJson;

type
{$METHODINFO ON}
  TServerData = class(TDataModule)
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    function Data: TJSONArray;
    function Meta: TJSONArray;
  end;
{$METHODINFO OFF}

var
  ServerData: TServerData;

implementation

{$R *.dfm}

{ TServerData }

function TServerData.Data: TJSONArray;
var
  jRecord: TJSONObject;
  I: Integer;
begin
  ClientDataSet1.Open;
  Result := TJSonArray.Create;

  while not ClientDataSet1.EOF do
  begin
    jRecord := TJSONObject.Create;
    for I := 0 to ClientDataSet1.FieldCount - 1 do
      jRecord.AddPair(
        ClientDataSet1.Fields[I].FieldName,
        TJSONString.Create (ClientDataSet1.Fields[I].AsString));
    Result.AddElement(jRecord);
    ClientDataSet1.Next;
  end;
end;

function TServerData.Meta: TJSONArray;
var
  jRecord: TJSONObject;
  I: Integer;
begin
  ClientDataSet1.Open;
  Result := TJSonArray.Create;

  for I := 0 to ClientDataSet1.FieldDefs.Count - 1 do
    Result.Add(ClientDataSet1.FieldDefs[I].Name);
end;

end.




