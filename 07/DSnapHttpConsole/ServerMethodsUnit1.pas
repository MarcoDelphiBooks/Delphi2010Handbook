unit ServerMethodsUnit1;

interface

uses
  SysUtils, Classes, DSServer;

type
{$METHODINFO ON}
  TServerMethods1 = class(TPersistent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

end.




