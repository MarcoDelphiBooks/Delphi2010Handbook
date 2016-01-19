unit UniCds_MainForm;

{.$RTTI EXPLICIT METHODS([]) FIELDS([]) PROPERTIES([])}

{$WeakLinkRtti on}
{$StrongLinktypes off}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  TFormUniCds = class(TForm)
    cds: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnPopulate: TButton;
    btnFieldNames: TButton;
    btnBookmark: TButton;
    btnFieldClass: TButton;
    btnFieldValue: TButton;
    procedure btnPopulateClick(Sender: TObject);
    procedure btnFieldNamesClick(Sender: TObject);
    procedure btnBookmarkClick(Sender: TObject);
    procedure btnFieldClassClick(Sender: TObject);
    procedure btnFieldValueClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SizeToCaption;
  end;

var
  FormUniCds: TFormUniCds;

implementation

{$R *.dfm}

uses
  Character, WideStrings, TypInfo;

procedure TFormUniCds.btnPopulateClick(Sender: TObject);
var
  I: Integer;
  sList: TStringList;
  strLine: string;
begin
  // load strings from a string list with unicode text...
  // in both a unicode and an ansi field type
  sList := TStringList.Create;
  try
    I := 1;
    sList.LoadFromFile('utf8text.txt');
    for strLine in sList do
    begin
      cds.InsertRecord([I, strLine, AnsiString(strLine)]);
      Inc (I);
    end;
  finally
    sList.Free;
  end;
end;

procedure TFormUniCds.DBGrid1TitleClick(Column: TColumn);
begin
  Cds.IndexFieldNames := Column.FieldName;
end;

procedure TFormUniCds.FormCreate(Sender: TObject);
begin
  cds.FieldDefs.Clear;
  cds.FieldDefs.Add ('code', ftInteger, 0, True);
  cds.FieldDefs.Add ('uni', ftWideString, 30, False);
  cds.FieldDefs.Add ('ansi', ftString, 30, False);
  cds.CreateDataSet;
  cds.Open;
  SizeToCaption;
end;

procedure TFormUniCds.SizeToCaption;
var
  nSize: Integer;
  hFile: THandle;
  strSize: String;
begin
  hFile := CreateFile (PChar (ParamStr (0)),
    0, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  nSize := GetFileSize (hFile, nil);
  CloseHandle (hFile);

  SetLength (strSize, 20);
  Str (nSize, strSize);

  Caption := 'Size = ' + strSize;
end;

procedure TFormUniCds.btnFieldNamesClick(Sender: TObject);
var
  List: TStringList;
  WideList: TWideStringList;
begin
  // optimized code
  List := TStringList.Create;
  try
    cds.GetFieldNames (List);
    ShowMessage (List.Text);
  finally
    List.Free;
  end;

  // Delphi 2007 compatible code
  WideList := TWideStringList.Create;
  try
    cds.GetFieldNames (WideList);
    ShowMessage (WideList.Text);
  finally
    WideList.Free;
  end;
end;

procedure TFormUniCds.btnFieldClassClick(Sender: TObject);
begin
  ShowMessage ('Field class: ' + cds.Fields[1].ClassName);
end;

procedure TFormUniCds.btnFieldValueClick(Sender: TObject);
begin
  ShowMessage ('Field value: ' + cds.Fields[1].AsString);
end;

procedure TFormUniCds.btnBookmarkClick(Sender: TObject);
var
  // bookm: TBookmarkStr; // won't compile
  bookm: TBookmark; // OK
begin
  // save current position
  bookm := cds.Bookmark;
  // move away
  cds.First;
  // get back
  cds.Bookmark := bookm;
end;

initialization
  // check that the bookmark usage is not leaking memory
  ReportMemoryLeaksOnShutdown := True;

end.
