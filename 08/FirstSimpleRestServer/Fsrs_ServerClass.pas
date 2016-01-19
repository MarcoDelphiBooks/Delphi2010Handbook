unit Fsrs_ServerClass;

interface

uses
  SysUtils, Classes, DSServer;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function TestParams (Value: string; var another: string): string;
  end;

var
  ServerMethods1: TServerMethods1;

implementation

{$R *.dfm}

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value + '...' +
    Copy (Value, 2, maxint) + '...' +
    Copy (Value, Length (Value) - 1, 2);
end;

function TServerMethods1.TestParams(Value: string; var another: string): string;
begin
  Another := another + '*';
  Result := Value + another;
end;

end.




