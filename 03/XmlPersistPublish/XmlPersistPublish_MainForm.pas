unit XmlPersistPublish_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
  TrivialXmlWriter, XmlPersistPublish_Classes;

procedure TForm1.Button1Click(Sender: TObject);
var
  aPerson: TPerson;
  aCompany: TCompany;
  ss: TStringStream;
  xmlWri: TTrivialXmlWriter;
begin
  // create a person
  aPerson := TPerson.Create;
  aPerson.Name := 'Willy';
  aPerson.Country := 'Desert';

  // create a company and add person to it
  aCompany := TCompany.Create;
  aCompany.Name := 'ACME Inc.';
  aCompany.ID := IntToStr (GetTickCount);
  aCompany.Country := 'Worldwide';
  aCompany.Person := aPerson;

  // stream the company (and person)
  ss := TStringStream.Create;
  try
    xmlWri := TTrivialXmlWriter.Create (ss);
    try
      xmlWri.WriteStartElement('company');
      xmlWri.WriteObjectPublished(aCompany);
      xmlWri.WriteEndElement;
    finally
       xmlWri.Free;
    end;
    // reset and laod stream
    ss.Position := 0;
    Memo1.Lines.LoadFromStream (ss);
  finally
    ss.Free;
  end;
end;

end.
