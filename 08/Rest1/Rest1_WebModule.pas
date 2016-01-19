unit Rest1_WebModule;

interface

uses
  SysUtils, Classes, HTTPApp, DB, DBClient;

type
  TWebModule3 = class(TWebModule)
    cdsCustomers: TClientDataSet;
    procedure actionEchoAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure actionCustomersAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure actionCustDataAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure actionCustomerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule3: TWebModule3;

implementation

uses
  WebReq, TrivialXmlWriter;

{$R *.dfm}

procedure TWebModule3.actionCustDataAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := cdsCustomers.XMLData;
  Response.ContentType := 'text/xml';
end;

const
  urlAction: AnsiString = '/Rest1.rest1/Customer/';

procedure TWebModule3.actionCustomerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  strCustId: string;
  sw: TStringWriter;
  xmlw: TTrivialXmlWriter;
  I: Integer;
begin
  strCustId := Copy (Request.PathInfo,
    Length (urlAction) + 1, MaxInt);
  sw := TStringWriter.Create;
  try
    xmlw := TTrivialXmlWriter.Create (sw);
    try
      xmlw.WriteStartElement('customer');
      cdsCustomers.Locate('custno', strCustId, []);
      for I := 0 to cdsCustomers.FieldCount - 1 do
      begin
        xmlw.WriteStartElement(cdsCustomers.Fields[I].FieldName);
        xmlw.WriteString(cdsCustomers.Fields[I].AsString);
        xmlw.WriteEndElement;
      end;
      xmlw.WriteEndElement;
    finally
      xmlw.Free;
    end;
    Response.Content := sw.ToString;
    Response.ContentType := 'text/xml';
  finally
    sw.Free;
  end;
end;

procedure TWebModule3.actionCustomersAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  sw: TStringWriter;
  xmlw: TTrivialXmlWriter;
begin
  sw := TStringWriter.Create;
  try
    xmlw := TTrivialXmlWriter.Create (sw);
    try
      xmlw.WriteStartElement('customers');
      cdsCustomers.First;
      while not cdsCustomers.Eof do
      begin
        xmlw.WriteStartElement('customer');
          xmlw.WriteStartElement('id');
            xmlw.WriteString(cdsCustomers['CustNo']);
          xmlw.WriteEndElement;
          xmlw.WriteStartElement('company');
            xmlw.WriteString(cdsCustomers['company']);
          xmlw.WriteEndElement;
        xmlw.WriteEndElement;
        cdsCustomers.Next;
      end;
      xmlw.WriteEndElement;
    finally
      xmlw.Free;
    end;
    Response.Content := sw.ToString;
    Response.ContentType := 'text/xml';
  finally
    sw.Free;
  end;
end;

procedure TWebModule3.actionEchoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  strInput: string;
begin
  strInput := Request.QueryFields.Values ['in'];
  if strInput = '' then
    strInput := 'Nothing to echo';
  strInput := strInput + '...' + Copy (
    strInput, Length (strInput) - 4, 5);
  Response.Content := '<result>' + strInput + '</result>';
  Response.ContentType := 'text/xml';
end;

procedure TWebModule3.WebModuleCreate(Sender: TObject);
begin
  cdsCustomers.Open;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TWebModule3;

end.

