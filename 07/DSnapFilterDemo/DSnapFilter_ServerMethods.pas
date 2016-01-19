unit DSnapFilter_ServerMethods;

interface

uses
  SysUtils, Classes, DSServer;

type
{$METHODINFO ON}
  TServerMethods2 = class(TPersistent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

function TServerMethods2.EchoString(Value: string): string;
begin
  Result := Value;
end;

end.




