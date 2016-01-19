unit Rest1Client_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Grids, DBGrids, DB, DBClient;

type
  TForm3 = class(TForm)
    edEcho: TEdit;
    btnEcho: TButton;
    lblEcho: TLabel;
    IdHTTP1: TIdHTTP;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnCDS: TButton;
    ListCust: TListBox;
    MemoCust: TMemo;
    btnCustList: TButton;
    procedure btnEchoClick(Sender: TObject);
    procedure btnCDSClick(Sender: TObject);
    procedure btnCustListClick(Sender: TObject);
    procedure ListCustDblClick(Sender: TObject);
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
  IdUri, StrUtils;

const
  BaseUrl = 'http://localhost:8081/Rest1.rest1';

function DataFromTopTag (const strXml: string): string;
begin
  Result := Copy (strXml, Pos ('>', strXml) + 1, maxint);
  Result := Copy (Result, 1, Pos ('<', Result) - 1);
end;

procedure TForm3.btnCustListClick(Sender: TObject);
var
  strListCust, strId, strName: string;
  nPos: Integer;
  nInit, nEnd: Integer;
begin
  ListCust.Clear;
  strListCust := IdHTTP1.Get(BaseUrl + '/customers');
  nPos := Pos ('<customer><id>', strListCust);
  while nPos > 0 do
  begin
    nInit := nPos + 14; // Length <customer><id>
    nEnd := PosEx ('</id>', strListCust, nPos);
    strId := Copy (strListCust, nInit, nEnd - nInit);
    nPos := PosEx ('<company>', strListCust, nEnd);
    nInit := nPos + Length ('<company>');
    nEnd := PosEx ('</company>', strListCust, nPos);
    strName := Copy (strListCust, nInit, nEnd - nInit);
    ListCust.Items.Add (strId + '=' + strName);
    nPos := PosEx ('<customer><id>', strListCust, nEnd);
  end;
end;

procedure TForm3.btnEchoClick(Sender: TObject);
var
  strInput, strResult: string;
begin
  strInput := TIdURI.ParamsEncode (edEcho.Text);
  strResult := IdHTTP1.Get(BaseUrl + '?in=' + strInput);
  lblEcho.Caption := DataFromTopTag (strResult);
end;

procedure TForm3.ListCustDblClick(Sender: TObject);
var
  strCust: string;
begin
  strCust := ListCust.Items.Names [ListCust.ItemIndex];
  MemoCust.Lines.Text :=
    IdHTTP1.Get(BaseUrl + '/customer/' + strCust);
end;

procedure TForm3.btnCDSClick(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.XMLData :=
    IdHTTP1.Get(BaseUrl + '/custdata');
  ClientDataSet1.Open;
end;

end.

