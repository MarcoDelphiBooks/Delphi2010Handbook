unit RssClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls;

type
  TRssForm = class(TForm)
    ListBox1: TListBox;
    btnUpdate: TButton;
    XMLDocument1: TXMLDocument;
    Panel1: TPanel;
    IdHTTP1: TIdHTTP;
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RssForm: TRssForm;

implementation

{$R *.dfm}

function getChildNodes (node: IDOMNode): string;
var
  J: Integer;
begin
  Result := '';
  for J := 0 to node.childNodes.length - 1 do
    if (node.childNodes.item[J].nodeType = TEXT_NODE) or
        (node.childNodes.item[J].nodeType = CDATA_SECTION_NODE) then
      Result := Result + node.childNodes.item[J].nodeValue;
end;

procedure TRssForm.btnUpdateClick(Sender: TObject);
var
  strXml, title, author, pubDate: string;
  I: Integer;
  IDomSel: IDOMNodeSelect;
  Node: IDOMNode;
begin
  strXml := IdHTTP1.Get ('http://feeds.delphifeeds.com/delphifeeds');
  XMLDocument1.LoadFromXML(strXml);
  XMLDocument1.Active := True;
  IDomSel := (XMLDocument1.DocumentElement.DOMNode as IDOMNodeSelect);
  for I := 1 to 15 do
  begin
    Node := IDomSel.selectNode('/rss/channel/item[' + IntToStr (i) + ']/title');
    title := getChildNodes (Node);
    Node := IDomSel.selectNode('/rss/channel/item[' + IntToStr (i) + ']/author');
    author := getChildNodes (Node);
    Node := IDomSel.selectNode('/rss/channel/item[' + IntToStr (i) + ']/pubDate');
    pubDate := getChildNodes (Node);
    ListBox1.Items.Add(author + ': ' + title + ' [' + pubDate + ']');
  end;
end;

end.
