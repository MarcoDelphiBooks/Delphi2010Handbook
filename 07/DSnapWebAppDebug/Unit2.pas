unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DbxDatasnap, FMTBcd, DBClient, DSConnect, DB, SqlExpr,
  Grids, DBGrids, StdCtrls,

  // AND THIS IS VERY IMPORTANT!
  DSHTTPLayer;

type
  TForm2 = class(TForm)
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
    SqlServerMethod1: TSqlServerMethod;
    DSProviderConnection1: TDSProviderConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  SqlServerMethod1.ExecuteMethod;
  ShowMessage (SqlServerMethod1.Params[1].AsString);
end;

end.
