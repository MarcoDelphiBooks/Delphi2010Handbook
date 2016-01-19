unit DSnapFilter_ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DbxDatasnap, FMTBcd, StdCtrls, DB, SqlExpr;

type
  TForm3 = class(TForm)
    SQLConnection1: TSQLConnection;
    SqlServerMethod1: TSqlServerMethod;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  DSHttpLayer, DbxCompressionFilter;


procedure TForm3.Button1Click(Sender: TObject);
begin
  SQLConnection1.Connected := True;
  SqlServerMethod1.Params[0].AsString := 'This is my name';
  SqlServerMethod1.ExecuteMethod;
  ShowMessage (SqlServerMethod1.Params[1].AsString);
end;

end.
