unit Win7Libraries_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnOpenClassic: TButton;
    btnOpenNew: TButton;
    OpenDialog1: TOpenDialog;
    FileOpenDialog1: TFileOpenDialog;
    btnLibraries: TButton;
    Memo1: TMemo;
    btnLibraryXml: TButton;
    procedure btnOpenClassicClick(Sender: TObject);
    procedure btnOpenNewClick(Sender: TObject);
    procedure btnLibrariesClick(Sender: TObject);
    procedure btnLibraryXmlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ShlObj, ComObj, PropSys, ObjectArray, ActiveX, KnownFolders;

procedure TForm1.btnLibraryXmlClick(Sender: TObject);
var
  pch: PChar;
begin
  OleCheck(SHGetKnownFolderPath (FOLDERID_DocumentsLibrary, 0, 0, pch));
  Memo1.Lines.LoadFromFile(pch);
end;

procedure TForm1.btnOpenClassicClick(Sender: TObject);
begin
  UseLatestCommonDialogs := False;
  OpenDialog1.Execute;
end;

procedure TForm1.btnOpenNewClick(Sender: TObject);
begin
  FileOpenDialog1.Execute;
end;

procedure TForm1.btnLibrariesClick(Sender: TObject);
var
  aLibrary: IShellLibrary;
  anArray: IObjectArray;
  nItems: Cardinal;
  I: Integer;
  item: IShellItem;
  pch: PChar;
  pnt: Pointer;
begin
  Memo1.Lines.Add('FOLDERID_DocumentsLibrary');
  OleCheck(SHGetKnownFolderPath (FOLDERID_DocumentsLibrary, 0, 0, pch));
  Memo1.Lines.Add('SHGetKnownFolderPath: ' + pch);

  OleCheck(SHGetKnownFolderItem(FOLDERID_DocumentsLibrary, 0, 0, IShellItem, pnt));
  item := IShellItem (pnt);
  item.GetDisplayName(SIGDN_NORMALDISPLAY, pch);
  Memo1.Lines.Add('SHGetKnownFolderItem.GetDisplayName: ' + pch);

  aLibrary := CreateComObject(CLSID_ShellLibrary) as IShellLibrary;
  aLibrary.LoadLibraryFromItem(item, PropSys.GPS_READWRITE);
  aLibrary.GetFolders(LFF_FORCEFILESYSTEM, IObjectArray, anArray);
  anArray.GetCount (nItems);
  for I := 0 to nItems - 1 do
  begin
    anArray.GetAt(I, IShellItem, item);
    item.GetDisplayName(SIGDN_NORMALDISPLAY, pch);
    Memo1.Lines.Add('Library item: ' + pch);
  end;
end;

end.
