// 
// Created by the DataSnap proxy generator.
// 

unit DSnapJsonClient_Proxy;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TDSnapJsonMethodsClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FSimpleValueCommand: TDBXCommand;
    FGetListCommand: TDBXCommand;
    FGetDataCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SimpleValue: TJSONValue;
    function GetList(nElem: Integer): TJSONArray;
    function GetData(strName: string): TJSONValue;
  end;

implementation

function TDSnapJsonMethodsClient.SimpleValue: TJSONValue;
begin
  if FSimpleValueCommand = nil then
  begin
    FSimpleValueCommand := FDBXConnection.CreateCommand;
    FSimpleValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSimpleValueCommand.Text := 'TDSnapJsonMethods.SimpleValue';
    FSimpleValueCommand.Prepare;
  end;
  FSimpleValueCommand.ExecuteUpdate;
  Result := TJSONValue(FSimpleValueCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSnapJsonMethodsClient.GetList(nElem: Integer): TJSONArray;
begin
  if FGetListCommand = nil then
  begin
    FGetListCommand := FDBXConnection.CreateCommand;
    FGetListCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetListCommand.Text := 'TDSnapJsonMethods.GetList';
    FGetListCommand.Prepare;
  end;
  FGetListCommand.Parameters[0].Value.SetInt32(nElem);
  FGetListCommand.ExecuteUpdate;
  Result := TJSONArray(FGetListCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TDSnapJsonMethodsClient.GetData(strName: string): TJSONValue;
begin
  if FGetDataCommand = nil then
  begin
    FGetDataCommand := FDBXConnection.CreateCommand;
    FGetDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDataCommand.Text := 'TDSnapJsonMethods.GetData';
    FGetDataCommand.Prepare;
  end;
  FGetDataCommand.Parameters[0].Value.SetWideString(strName);
  FGetDataCommand.ExecuteUpdate;
  Result := TJSONValue(FGetDataCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


constructor TDSnapJsonMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TDSnapJsonMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TDSnapJsonMethodsClient.Destroy;
begin
  FreeAndNil(FSimpleValueCommand);
  FreeAndNil(FGetListCommand);
  FreeAndNil(FGetDataCommand);
  inherited;
end;

end.
