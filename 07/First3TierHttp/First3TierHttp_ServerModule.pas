unit First3TierHttp_ServerModule;

interface

uses
  SysUtils, Classes, DSServer, WideStrings, DBXInterbase, FMTBcd, Provider, DB,
  SqlExpr, DSCommonServer, DSTCPServerTransport, DBXFirebird;

type
  TDSFirst3TierServerModule = class(TDSServerModule)
    EMPLOYEE: TSQLDataSet;
    DataSetProviderEmployee: TDataSetProvider;
    EMPLOYEEEMP_NO: TSmallintField;
    EMPLOYEEFIRST_NAME: TStringField;
    EMPLOYEELAST_NAME: TStringField;
    EMPLOYEEPHONE_EXT: TStringField;
    EMPLOYEEHIRE_DATE: TSQLTimeStampField;
    EMPLOYEEDEPT_NO: TStringField;
    EMPLOYEEJOB_CODE: TStringField;
    EMPLOYEEJOB_GRADE: TSmallintField;
    EMPLOYEEJOB_COUNTRY: TStringField;
    EMPLOYEESALARY: TFMTBCDField;
    EMPLOYEEFULL_NAME: TStringField;
    FBCONNECTION: TSQLConnection;
  private
    { Private declarations }
  public
    function GetHello: string;
  end;

var
  DSFirst3TierServerModule: TDSFirst3TierServerModule;

implementation

{$R *.dfm}

{ TDSFirst3TierServerModule }

function TDSFirst3TierServerModule.GetHello: string;
begin
  Result := 'Hello from TDSFirst3TierServerModule at ' + TimeToStr (Now);
end;

end.