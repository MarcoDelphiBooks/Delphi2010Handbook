unit LargeXmlForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Provider, DBClient, DB, SqlExpr,
  xmldom, Xmlxform, saxForm, msxml, ActiveX, ComObj, Grids,
  DBGrids, XMLIntf, AdomCore_4_3, adomxmldom, SimpleDS, msxmldom, XMLDoc, ExtCtrls;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    btnSaveXmlPacket: TButton;
    XMLTransformClient1: TXMLTransformClient;
    btnTransform: TButton;
    memoLog: TMemo;
    btnSaveCustom: TButton;
    btnReadSAXMS: TButton;
    ClientDataSet2: TClientDataSet;
    DBGrid: TDBGrid;
    DataSource1: TDataSource;
    btnReadSaxOpen: TButton;
    XMLDocument1: TXMLDocument;
    btnLoadDomOpen: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    SimpleDataSet1: TSimpleDataSet;
    XMLDocument2: TXMLDocument;
    btnLoadDomMS: TButton;
    radioSize: TRadioGroup;
    btnCreate: TButton;
    Bevel2: TBevel;
    procedure btnSaveXmlPacketClick(Sender: TObject);
    procedure btnTransformClick(Sender: TObject);
    procedure btnSaveCustomClick(Sender: TObject);
    procedure btnReadSAXMSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnReadSaxOpenClick(Sender: TObject);
    procedure btnLoadDomOpenClick(Sender: TObject);
    procedure btnLoadDomMSClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
  private
    sax: IVBSAXXMLReader;
  public
    procedure ParseFile;
  end;


  TMyDataSaxHandler = class (TMySaxHandler)
  private
    strCurrent: string;
  public
    procedure startElement(var strNamespaceURI: WideString; var strLocalName: WideString;
                           var strQName: WideString; const oAttributes: IVBSAXAttributes); override; safecall;
    procedure characters(var strChars: WideString); override; safecall;
    procedure endElement(var strNamespaceURI: WideString;
      var strLocalName: WideString; var strQName: WideString); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  saxphilo, DbxFirebird, UriUtils;

procedure TForm1.btnSaveXmlPacketClick(Sender: TObject);
var
  sWriter: TStreamWriter;
  t: TTime;
begin
  t := now;
  sWriter := TStreamWriter.Create ('data.xml', False {replace});
  try
    sWriter.Write (ClientDataSet1.XMLData);
  finally
    sWriter.free;
  end;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
end;

procedure TForm1.btnTransformClick(Sender: TObject);
var
  sWriter: TStreamWriter;
  t: TTime;
begin
  t := now;
  sWriter := TStreamWriter.Create ('data2.xml', False {replace});
  try
    sWriter.Write (XMLTransformClient1.GetDataAsXml(''));
  finally
    sWriter.Free;
  end;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
end;

function MakeXmlstr (node, value: string): string;
begin
  Result := '<' + node + '>' + value + '</' + node + '>';
end;

procedure TForm1.btnSaveCustomClick(Sender: TObject);
var
  sWriter: TStreamWriter;
  str1: string;
  t: TTime;
  i: Integer;
begin
  t := now;
  sWriter := TStreamWriter.Create ('data3.xml', False {replace});
  try
    ClientDataSet1.First;
    str1 := '<?xml version="1.0" standalone="yes" ?><employee>' ;
    sWriter.WriteLine(str1);

    while not ClientDataSet1.EOF do
    begin
      str1 := '';
      for i := 0 to ClientDataSet1.FieldCount - 1 do
        str1 := str1 + MakeXmlstr (ClientDataSet1.Fields[i].FieldName,
          ClientDataSet1.Fields[i].AsString);

      str1 := MakeXmlStr ('employeeData', str1);
      sWriter.WriteLine(str1);

      ClientDataSet1.Next
    end;
    str1 := '</employee>' ;
    sWriter.WriteLine(str1);
  finally
    sWriter.free;
  end;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
end;


procedure TForm1.ParseFile;
var
  filename: string;
begin
  filename := ExtractFilePath (Application.Exename) + 'data3.xml';
  if FileExists (filename) then
  begin
    sax.parseURL (filename)
  end
  else
    Log.Add ('file not found: ' + filename);
end;


procedure TForm1.btnReadSAXMSClick(Sender: TObject);
var
  t: TTime;
begin
  DataSource1.DataSet := nil;
  ClientDataSet2.Close;
  ClientDataSet2.FieldDefs := ClientDataSet1.FieldDefs;
  ClientDataSet2.CreateDataSet;
  ClientDataSet2.Open;
  Log := memoLog.Lines;
  sax.ContentHandler := TMyDataSaxHandler.Create;
  t := now;
  ParseFile;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
  DataSource1.DataSet := ClientDataSet2;
  memoLog.Lines.Add(inttostr (ClientDataSet2.RecordCount));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SimpleDataSet1.Open;
  ClientDataSet1.FieldDefs := SimpleDataSet1.FieldDefs;
  ClientDataSet1.CreateDataSet;
  // create sax and connect error handler
  sax := CreateComObject (CLASS_SAXXMLReader) as IVBSAXXMLReader;
  sax.ErrorHandler := TMySaxErrorHandler.Create;
end;

{ TMyDataSaxHandler }

procedure TMyDataSaxHandler.characters(var strChars: WideString);
begin
  inherited;
  strCurrent := strCurrent + RemoveWhites(strChars);
end;

procedure TMyDataSaxHandler.endElement(var strNamespaceURI, strLocalName,
  strQName: WideString);
begin
  if strLocalName = 'employeeData' then
    Form1.clientdataset2.Post;
  if stack.Count > 2 then
    Form1.ClientDataSet2.FieldByName (strLocalName).AsString := strCurrent;
  inherited;
end;

procedure TMyDataSaxHandler.startElement(var strNamespaceURI, strLocalName,
  strQName: WideString; const oAttributes: IVBSAXAttributes);
begin
  inherited;
  if strLocalName = 'employeeData' then
    Form1.clientdataset2.Insert;
  strCurrent := '';
end;

procedure TForm1.btnReadSaxOpenClick(Sender: TObject);
var
  t: TTime;
  reader: TXmlStandardDocReader;
  SysId, filename: string;
  inputSource: TXmlInputSource;
  SourceStream: TFileStream;
begin
  DataSource1.DataSet := nil;
  ClientDataSet2.Close;
  ClientDataSet2.FieldDefs := ClientDataSet1.FieldDefs;
  ClientDataSet2.CreateDataSet;
  ClientDataSet2.Open;

  Log := memoLog.Lines;
  filename := ExtractFilePath (Application.Exename) + 'data3.xml';
  reader:= TXmlStandardDocReader.Create (nil);
  try
    reader.NextHandler := TDataSaxHandler.Create (nil);

    SourceStream := TFileStream.Create(Filename, fmOpenRead);
    SysId := FilenameToUriWideStr(Filename, []);
    inputSource := TXmlInputSource.Create(SourceStream, '', SysId, 4096,
                    '', False, 0, 0, 0, 0, 1);
    t := now;
    reader.Parse (inputSource);
    t := now - t;

    memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
    DataSource1.DataSet := ClientDataSet2;
    memoLog.Lines.Add(inttostr (ClientDataSet2.RecordCount));
  finally
    inputSource.Free;
    SourceStream.Free;
    reader.free;
  end;
end;

procedure TForm1.btnLoadDomOpenClick(Sender: TObject);
var
  t: TTime;
  filename: string;
begin
  filename := ExtractFilePath (Application.Exename) + 'data3.xml';
  xmlDocument1.FileName := filename;
  t := now;
  xmlDocument1.Active := True;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
end;

procedure TForm1.btnLoadDomMSClick(Sender: TObject);
var
  t: TTime;
  filename: string;
begin
  filename := ExtractFilePath (Application.Exename) + 'data3.xml';
  xmlDocument2.FileName := filename;
  t := now;
  xmlDocument2.Active := True;
  t := now - t;
  memoLog.Lines.Add(FormatDateTime ('ss.zzz', t));
end;

procedure TForm1.btnCreateClick(Sender: TObject);
var
  I, nCount: Integer;
begin
  case radioSize.ItemIndex of
    0: nCount := 300;
    1: nCount := 3000;
    2: nCount := 30000;
  else
    nCount := 300;
  end;

  // fetch data and create a large in-memory structure
  ClientDataSet1.LogChanges := False;
  Screen.Cursor := crHourGlass;
  try
    while ClientDataSet1.RecordCount < nCount do
    begin
      SimpleDataSet1.RecNo := Random (SimpleDataSet1.RecordCount) + 1;
      ClientDataSet1.Insert;
      ClientDataSet1.Fields [0].AsInteger := Random (10000);
      for I := 1 to SimpleDataSet1.FieldCount - 1 do
        ClientDataSet1.Fields [i].AsString := SimpleDataSet1.Fields [i].AsString;
      ClientDataSet1.Post;
      if (ClientDataSet1.RecordCount mod 100) = 0 then
        Application.ProcessMessages;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
