unit ObjectsRestServer_Classes;

interface

uses
  SysUtils, Classes, DSServer, DBXJson, DBXJSONReflect, Generics.Collections;

type
  TMyData = class (TPersistent)
  public
    Name: String;
    Value: Integer;
  public
    constructor Create (const aName: string);
  end;

{$METHODINFO ON}
  TObjectsRest = class(TPersistent)
  public
    function List: TJSONArray;

    function PlainData (name: string): TJSONValue;
    function DataMarshal (name: string): TJSONObject;

    function MyData (name: string): TJSONObject;
    procedure updateMyData (name, value: string);
    procedure cancelMyData (name: string);
    procedure acceptMyData (name, value: string);
  end;
{$METHODINFO OFF}

implementation

var
  DataDict: TObjectDictionary <string,TMyData>;

procedure AddToDictionary (const aName: string; nVal: Integer = -1);
var
  md: TMyData;
begin
  md := TMyData.Create (aName);
  if nVal <> -1 then
    md.Value := nVal;
  DataDict.Add(aName, md);
end;

{ TMyData }

constructor TMyData.Create(const aName: string);
begin
  Name := aName;
  Value := Random (10000);
end;

{ TObjectsRest }

procedure TObjectsRest.cancelMyData(name: string);
begin
  DataDict.Remove(name);
end;

function TObjectsRest.DataMarshal(name: string): TJSONObject;
var
  jMarshal: TJSONMarshal;
begin
  jMarshal := TJSONMarshal.Create(TJSONConverter.Create);
  Result := jMarshal.Marshal(DataDict[name]) as TJSONObject;
end;

function TObjectsRest.List: TJSONArray;
var
  str: string;
begin
  Result := TJSONArray.Create;
  for str in DataDict.Keys do
  begin
    Result.Add(str);
  end;
end;

function TObjectsRest.MyData(name: string): TJSONObject;
var
  md: TMyData;
begin
  md := DataDict[name];
  Result := TJSONObject.Create;
  Result.AddPair(
    TJSONPair.Create ('Name', md.Name));
  Result.AddPair(
    TJSONPair.Create ('Value', TJSONNumber.Create(md.Value)));
end;

function TObjectsRest.PlainData(name: string): TJSONValue;
begin
  if Name = '' then
    name := 'Sample'; // default
  Result := TJSONNumber.Create(DataDict[name].Value);
end;

procedure TObjectsRest.updateMyData (name, value: string);
begin
  DataDict[name].Value := StrToIntDef (Value, 0);
end;

procedure TObjectsRest.acceptMyData(name, value: string);
begin
  AddToDictionary (name, StrToIntDef (Value, 0));
end;

initialization
  randomize;
  DataDict := TObjectDictionary <string,TMyData>.Create;
  AddToDictionary('Sample');
  AddToDictionary('Test');

end.




