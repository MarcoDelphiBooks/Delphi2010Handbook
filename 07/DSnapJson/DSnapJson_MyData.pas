unit DSnapJson_MyData;

interface

type
  TMyData = class
  private
    Name: String;
    Value: Integer;
  public
    constructor Create (const aName: string);
    function ToString: string; override;
  end;

implementation

uses
  SysUtils;

{ TMyData }

constructor TMyData.Create(const aName: string);
begin
  Name := aName;
  Value := Random (1000);
end;

function TMyData.ToString: string;
begin
  Result := Name + ':' + IntToStr (Value);
end;

initialization
  randomize;

end.
