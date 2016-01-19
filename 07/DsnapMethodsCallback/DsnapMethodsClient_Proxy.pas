//
// Created by the DataSnap proxy generator.
// 

unit DsnapMethodsClient_Proxy;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TSimpleServerClassClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FEchoCommand: TDBXCommand;
    FSlowPrimeCommand: TDBXCommand;
    FSlowPrimeCallBackCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Echo(Text: string): string;
    function SlowPrime(MaxValue: Integer): Integer;
    function SlowPrimeCallBack(MaxValue: Integer; aCallBack: TDBXCallback): Integer;
  end;

  TStorageServerClassClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FSetValueCommand: TDBXCommand;
    FGetValueCommand: TDBXCommand;
    FToStringCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure SetValue(Value: Integer);
    function GetValue: Integer;
    function ToString: string;
  end;

implementation

function TSimpleServerClassClient.Echo(Text: string): string;
begin
  if FEchoCommand = nil then
  begin
    FEchoCommand := FDBXConnection.CreateCommand;
    FEchoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoCommand.Text := 'TSimpleServerClass.Echo';
    FEchoCommand.Prepare;
  end;
  FEchoCommand.Parameters[0].Value.SetWideString(Text);
  FEchoCommand.ExecuteUpdate;
  Result := FEchoCommand.Parameters[1].Value.GetWideString;
end;

function TSimpleServerClassClient.SlowPrime(MaxValue: Integer): Integer;
begin
  if FSlowPrimeCommand = nil then
  begin
    FSlowPrimeCommand := FDBXConnection.CreateCommand;
    FSlowPrimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSlowPrimeCommand.Text := 'TSimpleServerClass.SlowPrime';
    FSlowPrimeCommand.Prepare;
  end;
  FSlowPrimeCommand.Parameters[0].Value.SetInt32(MaxValue);
  FSlowPrimeCommand.ExecuteUpdate;
  Result := FSlowPrimeCommand.Parameters[1].Value.GetInt32;
end;

function TSimpleServerClassClient.SlowPrimeCallBack(MaxValue: Integer; aCallBack: TDBXCallback): Integer;
begin
  if FSlowPrimeCallBackCommand = nil then
  begin
    FSlowPrimeCallBackCommand := FDBXConnection.CreateCommand;
    FSlowPrimeCallBackCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSlowPrimeCallBackCommand.Text := 'TSimpleServerClass.SlowPrimeCallBack';
    FSlowPrimeCallBackCommand.Prepare;
  end;
  FSlowPrimeCallBackCommand.Parameters[0].Value.SetInt32(MaxValue);
  FSlowPrimeCallBackCommand.Parameters[1].Value.SetCallbackValue(aCallBack);
  FSlowPrimeCallBackCommand.ExecuteUpdate;
  Result := FSlowPrimeCallBackCommand.Parameters[2].Value.GetInt32;
end;


constructor TSimpleServerClassClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TSimpleServerClassClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TSimpleServerClassClient.Destroy;
begin
  FreeAndNil(FEchoCommand);
  FreeAndNil(FSlowPrimeCommand);
  FreeAndNil(FSlowPrimeCallBackCommand);
  inherited;
end;

procedure TStorageServerClassClient.SetValue(Value: Integer);
begin
  if FSetValueCommand = nil then
  begin
    FSetValueCommand := FDBXConnection.CreateCommand;
    FSetValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetValueCommand.Text := 'TStorageServerClass.SetValue';
    FSetValueCommand.Prepare;
  end;
  FSetValueCommand.Parameters[0].Value.SetInt32(Value);
  FSetValueCommand.ExecuteUpdate;
end;

function TStorageServerClassClient.GetValue: Integer;
begin
  if FGetValueCommand = nil then
  begin
    FGetValueCommand := FDBXConnection.CreateCommand;
    FGetValueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetValueCommand.Text := 'TStorageServerClass.GetValue';
    FGetValueCommand.Prepare;
  end;
  FGetValueCommand.ExecuteUpdate;
  Result := FGetValueCommand.Parameters[0].Value.GetInt32;
end;

function TStorageServerClassClient.ToString: string;
begin
  if FToStringCommand = nil then
  begin
    FToStringCommand := FDBXConnection.CreateCommand;
    FToStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FToStringCommand.Text := 'TStorageServerClass.ToString';
    FToStringCommand.Prepare;
  end;
  FToStringCommand.ExecuteUpdate;
  Result := FToStringCommand.Parameters[0].Value.GetWideString;
end;


constructor TStorageServerClassClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TStorageServerClassClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TStorageServerClassClient.Destroy;
begin
  FreeAndNil(FSetValueCommand);
  FreeAndNil(FGetValueCommand);
  FreeAndNil(FToStringCommand);
  inherited;
end;

end.
