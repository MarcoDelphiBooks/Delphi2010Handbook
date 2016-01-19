unit DSnapServerMethods;

interface

uses
  SysUtils, Classes, DSServer, Provider, DB, DBClient, WideStrings, DBXFirebird,
  FMTBcd, SqlExpr;

type
  TServerMethods1 = class(TDSServerModule)
    DataSetProvider1: TDataSetProvider;
    FBCONNECTION: TSQLConnection;
    CUSTOMER: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function GetDataSet: TDataset;
  end;

var
  ServerMethods1: TServerMethods1;

implementation

{$R *.dfm}

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value + ' ' + Value;
end;

function TServerMethods1.GetDataSet: TDataset;
begin
  // cannot convert to JSON type
  CUSTOMER.Open;
  Result := CUSTOMER;
end;

end.




