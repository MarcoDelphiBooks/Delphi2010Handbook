unit GeoLocationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdUri, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, DB, DBClient, Grids, DBGrids,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext, ExtCtrls,
  OleCtrls, SHDocVw, IniFiles, ComCtrls;

type
  TFormMap = class(TForm)
    btnGetTowns: TButton;
    ListBox1: TListBox;
    IdHTTP1: TIdHTTP;
    btnGeocoding: TButton;
    cdsTown: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    procedure btnGetTownsClick(Sender: TObject);
    procedure btnGeocodingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sListCity: tStringList;
    inifile: TMemIniFile;
    googleMapKey: string;
    function GetIniFileName: string;
  end;

var
  FormMap: TFormMap;

implementation

uses
  SHFolder, ShellApi;

{$R *.dfm}

procedure TFormMap.btnGeocodingClick(Sender: TObject);
var
  I: Integer;
  strResponse, str1, str2: string;
  sList:TStringList;
begin
  cdsTown.Active := False;
  cdsTown.CreateDataSet;
  cdsTown.Active := True;
  sList := TStringList.Create;

  for I := 0 to sListCity.Count - 1 do
  begin
    ListBox1.ItemIndex := I;
    Application.ProcessMessages;
    if Length (sListCity.Names[I]) > 2 then
    begin
      strResponse := IdHTTP1.Get( TIDUri.UrlEncode(
          'http://maps.google.com/maps/geo?q=' +
          (sListCity.Names[I]) + '&output=csv&key=' + googleMapKey));
      sList.LineBreak := ',';
      sList.Text := strResponse;
      str1 := sList[2];
      str2 := sList[3];
      cdsTown.AppendRecord([sListCity.Names[I],
        StrToFloat (str1), StrToFloat (str2),
        Length (sListCity.ValueFromIndex[I])]);
      Sleep (150);
      Application.ProcessMessages;
    end;
  end;
  sList.Free;
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

procedure TFormMap.FormCreate(Sender: TObject);
var
  inifileName: string;
begin
  inifileName := GetIniFileName;
  inifile := TMemIniFile.Create (iniFilename);
  googleMapKey := inifile.ReadString('googlemap', 'devkey', '');
  if googleMapKey = '' then
    raise Exception.Create ('Missing dev key');
end;

end.
