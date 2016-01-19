//
// Created by the DataSnap proxy generator.
// 

unit First3TierHttp_ClientClasses;

interface

uses DBXCommon, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TDSFirst3TierServerModuleClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FGetHelloCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetHello: string;
  end;

implementation

function TDSFirst3TierServerModuleClient.GetHello: string;
begin
  if FGetHelloCommand = nil then
  begin
    FGetHelloCommand := FDBXConnection.CreateCommand;
    FGetHelloCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetHelloCommand.Text := 'TDSFirst3TierServerModule.GetHello';
    FGetHelloCommand.Prepare;
  end;
  FGetHelloCommand.ExecuteUpdate;
  Result := FGetHelloCommand.Parameters[0].Value.GetWideString;
end;


constructor TDSFirst3TierServerModuleClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
FInstanceOwner := True;
end;


constructor TDSFirst3TierServerModuleClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TDSFirst3TierServerModuleClient.Destroy;
begin
  FreeAndNil(FGetHelloCommand);
  inherited;
end;

end.
