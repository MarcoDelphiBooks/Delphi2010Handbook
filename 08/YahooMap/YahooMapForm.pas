unit YahooMapForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdUri, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, DB, DBClient, Grids, DBGrids,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext, ExtCtrls,
  OleCtrls, SHDocVw, IniFiles, ComCtrls, PngImage;

type
  TFormMap = class(TForm)
    btnGetTowns: TButton;
    ListBox1: TListBox;
    IdHTTP1: TIdHTTP;
    btnGeocoding: TButton;
    Image1: TImage;
    XMLDocument1: TXMLDocument;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    procedure btnGetTownsClick(Sender: TObject);
    procedure btnGeocodingClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sListCity: tStringList;
    inifile: TMemIniFile;
    yahooAppid: string;
    function GetIniFileName: string;
  end;

var
  FormMap: TFormMap;

implementation

uses
  SHFolder, ShellApi;

{$R *.dfm}

const
  BaseUrl = 'http://api.local.yahoo.com/MapsService/V1/';

procedure TFormMap.btnGeocodingClick(Sender: TObject);
var
  strResult: string;
  memStr: tFileStream;
begin                                                                                        {image_type=gif&}
  if ListBox1.itemIndex < 0  then
  begin
    ShowMessage ('Select an item in the listbox');
    Exit;
  end;

  strResult := IdHTTP1.Get(BaseUrl +
    'mapImage?' +
    'appid=' + yahooAppid +
    '&city=' + TIdURI.ParamsEncode (ListBox1.Items.Names[ListBox1.itemIndex]));

  XMLDocument1.Active := False;
  XMLDocument1.XML.Text := strResult;
  XMLDocument1.Active := True;
  strResult := XMLDocument1.DocumentElement.NodeValue;
  XMLDocument1.Active := False;

  // now let's get the referred image
  memStr:= tFileStream.Create ('temp.png', fmCreate);
  IdHttp1.Get(strResult, memStr);
  memStr.Free;

  Image1.Picture.LoadFromFile('temp.png');
end;

procedure TFormMap.btnGetTownsClick(Sender: TObject);
var
  strCity: string;
  nPos: Integer;
begin
  NullStrictConvert := False;
  NullAsStringValue := '';

  if not Assigned (sListCity) then
    sListCity := tStringList.Create;
  sListCity.Clear;

  ClientDataSet1.Active := True;
  while not ClientDataSet1.EOF do
  begin
    strCity := ClientDataSet1['City'] + ', ' + ClientDataSet1['State'] +
      ', ' + ClientDataSet1['Country'];
    if (strCity <> '') then
    begin
      nPos := sListCity.IndexOfName (strCity);
      if nPos >= 0 then
      begin
        sListCity.ValueFromIndex [nPos] := sListCity.ValueFromIndex [nPos] + '*';
      end
      else
      begin
        sListCity.Add (strCity + '=*');
      end;
    end;
    ClientDataSet1.Next;
  end;

  ListBox1.Items := sListCity;
end;

procedure TFormMap.Button1Click(Sender: TObject);
var
  strResult: string;
  memStr: tFileStream;
begin
  strResult := IdHTTP1.Get(BaseUrl +
    'mapImage?' +
    'appid=' + yahooAppid +
    '&city=SanJose,California');

  XMLDocument1.Active := False;
  XMLDocument1.XML.Text := strResult;
  XMLDocument1.Active := True;
  strResult := XMLDocument1.DocumentElement.NodeValue;
  XMLDocument1.Active := False;

  // now let's get the referred image
  memStr:= TFileStream.Create ('temp.png', fmCreate);
  IdHttp1.Get(strResult, memStr);
  memStr.Free;

  Image1.Picture.LoadFromFile('temp.png');
end;

procedure TFormMap.FormCreate(Sender: TObject);
var
  inifileName: string;
begin
  inifileName := GetIniFileName;
  inifile := TMemIniFile.Create (iniFilename);
  yahooAppid := inifile.ReadString('yahoo', 'appid', '');
  if yahooAppid = '' then
    raise Exception.Create ('Missing appid key');
end;

function TFormMap.GetIniFileName: string;
var
  strFolder: string;
begin
  SetLength (strFolder, 250);
  ShGetFolderPath (0,
    CSIDL_PERSONAL, 0, 0, PChar(strFolder));
  SetLength (strFolder, StrLen(PChar(strFolder)));
  strFolder := strFolder + PathDelim;
  Result := strFolder +
    ChangeFileExt (ExtractFileName(ParamStr(0)), '.ini');
end;

end.
