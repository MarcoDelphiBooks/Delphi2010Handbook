unit DsnapMethodsServer_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSCommonServer, DSTCPServerTransport, DSServer, StdCtrls, ExtCtrls,
  DBXJSON;


type
  TFormDsnapMethodsServer = class(TForm)
    DSServer1: TDSServer;
    DSServerClass1: TDSServerClass;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass2: TDSServerClass;
    Memo1: TMemo;
    procedure DSServerClass2GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSSC2DestroyInstance(
      DSDestroyInstanceEventObject: TDSDestroyInstanceEventObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

{$MethodInfo ON}
  TSimpleServerClass = class(TPersistent)
  public
    function Echo (const Text: string): string;
    function SlowPrime (MaxValue: Integer): Integer;
    function SlowPrimeCallBack (MaxValue: Integer;
      aCallBack: TDBXCallback): Integer;
  end;
{$MethodInfo OFF}

{$MethodInfo ON}
  TStorageServerClass = class(TPersistent)
  private
    FValue: Integer;
  public
    procedure SetValue(const Value: Integer);
    function GetValue: Integer;
    function ToString: string; override;
  published
    property Value: Integer read GetValue write SetValue;
  end;
{$MethodInfo OFF}

var
  FormDsnapMethodsServer: TFormDsnapMethodsServer;
  ParamLifeCycle: string;

implementation

{$R *.dfm}

procedure TFormDsnapMethodsServer.DSServer1Connect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  Log ('Client connected');
end;

procedure TFormDsnapMethodsServer.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  Log ('Client disconnected');
end;

procedure TFormDsnapMethodsServer.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TSimpleServerClass;
end;

procedure TFormDsnapMethodsServer.DSSC2DestroyInstance(
  DSDestroyInstanceEventObject: TDSDestroyInstanceEventObject);
begin
  // only if LifeCycle = 'Invocation' or 'Server'
  // uncomment to avoid memory leak
  DSDestroyInstanceEventObject.ServerClassInstance.Free;
end;

procedure TFormDsnapMethodsServer.DSServerClass2GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  DSServerClass2.LifeCycle := ParamLifeCycle;
  Log ('LifeCycle: ' + DSServerClass2.LifeCycle);
  PersistentClass := TStorageServerClass;
end;

procedure TFormDsnapMethodsServer.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

{ TSimpleServerClass }

function TSimpleServerClass.Echo(const Text: string): string;
begin
  FormDsnapMethodsServer.Log ('Echoing ' + Text);
  Result := Text + '...' +
    Copy (Text, 2, maxint) + '...' +
    Copy (Text, Length (Text) - 1, 2);
end;

{function local to the unit}
function IsPrime (N: Integer): Boolean;
var
  Test: Integer;
begin
  IsPrime := True;
  for Test := 2 to N - 1 do
    if (N mod Test) = 0 then
    begin
      IsPrime := False;
      break; {jump out of the for loop}
    end;
end;

function TSimpleServerClass.SlowPrime(MaxValue: Integer): Integer;
var
  I: Integer;
begin
  FormDsnapMethodsServer.Log (
    'Starting SlowPrime for ' + IntToHex (Self.GetHashCode, 4));
  // counts the prime numbers below the given value
  Result := 0;
  for I := 1 to MaxValue do
  begin
    if IsPrime (I) then
      Inc (Result);
  end;
  FormDsnapMethodsServer.Log (
    'Done SlowPrime for ' + IntToHex (Self.GetHashCode, 4));
end;

function TSimpleServerClass.SlowPrimeCallBack(MaxValue: Integer;
  aCallBack: TDBXCallback): Integer;
var
  I: Integer;
  jsonResult: TJSONValue;
  isFalse: Boolean;
begin
  FormDsnapMethodsServer.Log (
    'Starting SlowPrimeCallBack for ' + IntToHex (Self.GetHashCode, 4));
  // counts the prime numbers below the given value

  FormDsnapMethodsServer.Log (
    'aCallback ' + IntToHex (aCallBack.GetHashCode, 4));

  Result := 0;
  for I := 1 to MaxValue do
  begin
    if IsPrime (I) then
      Inc (Result);
    if (I mod 100) = 0 then
    begin
      jsonResult := aCallBack.Execute(TJSONNumber.Create(I));
      isFalse := jsonResult is TJSONFalse;
      jsonResult.Free;
      if isFalse then
        Break;
    end;
  end;
  FormDsnapMethodsServer.Log (
    'Done SlowPrimeCallBack for ' + IntToHex (Self.GetHashCode, 4));
end;

{ TStorageServerClass }

function TStorageServerClass.GetValue: Integer;
begin
  FormDsnapMethodsServer.Log ('Getting value: ' + IntToStr (FValue));
  Result := FValue;
end;

procedure TStorageServerClass.SetValue(const Value: Integer);
begin
  FormDsnapMethodsServer.Log ('Setting value: ' + IntToStr (Value));
  FValue := Value;
end;

function TStorageServerClass.ToString: string;
begin
  FormDsnapMethodsServer.Log ('Returning ToString for ' +
    IntToHex (GetHashCode, 4));
  Result := 'Value: ' + IntToStr (Value) +
    ' - Object: ' + IntToHex (GetHashCode, 4);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
