unit First3TierHttp_ClientMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DbxDatasnap, DB, DBClient, SqlExpr, DSConnect, StdCtrls,
  Grids, DBGrids, FMTBcd;

type
  TFormFirst3Tier2009Client = class(TForm)
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnOpen: TButton;
    btnHello: TButton;
    SqlServerMethod1: TSqlServerMethod;
    FIRST: TSQLConnection;
    procedure btnOpenClick(Sender: TObject);
    procedure btnHelloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFirst3Tier2009Client: TFormFirst3Tier2009Client;

implementation

uses
  First3TierHttp_ClientClasses, DSHTTPLayer;

var
  ServerProxyObject: TDSFirst3TierServerModuleClient;

{$R *.dfm}

procedure TFormFirst3Tier2009Client.btnHelloClick(Sender: TObject);
begin
  SqlServerMethod1.ExecuteMethod;
  ShowMessage (SqlServerMethod1.Params[0].Value);

  // or in alternative...
  with TDSFirst3TierServerModuleClient.Create(SQLConnection1.DBXConnection) do
  try
    ShowMessage (GetHello);
  finally
    Free;
  end;

  // or even better...
  ShowMessage (ServerProxyObject.GetHello);
end;

procedure TFormFirst3Tier2009Client.btnOpenClick(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

procedure TFormFirst3Tier2009Client.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates (-1);
end;

procedure TFormFirst3Tier2009Client.ClientDataSet1BeforeEdit(DataSet: TDataSet);
begin
  ClientDataSet1.RefreshRecord;
  ClientDataSet1.UpdateRecord;
end;

procedure TFormFirst3Tier2009Client.FormCreate(Sender: TObject);
begin
  SQLConnection1.Open;
  ServerProxyObject := TDSFirst3TierServerModuleClient.
    Create(SQLConnection1.DBXConnection)
end;

procedure TFormFirst3Tier2009Client.FormDestroy(Sender: TObject);
begin
  FreeAndNil (ServerProxyObject);
end;

end.
