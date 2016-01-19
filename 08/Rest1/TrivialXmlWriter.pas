unit TrivialXmlWriter;

interface

uses
  Generics.Collections, Classes;

type
  TTrivialXmlWriter = class
  private
    fWriter: TTextWriter;
    fNodes: TStack<string>;
  public
    constructor Create (aWriter: TTextWriter);
    destructor Destroy; override;
    procedure WriteStartElement (const sName: string);
    procedure WriteEndElement;
    procedure WriteString (const sValue: string);
  end;

implementation

{ TTrivialXmlWriter }

constructor TTrivialXmlWriter.Create(aWriter: TTextWriter);
begin
  fWriter := aWriter;
  fNodes := TStack<string>.Create;
end;

destructor TTrivialXmlWriter.Destroy;
begin
  while fNodes.Count > 0 do
    WriteEndElement;
  fNodes.Free;
  inherited;
end;

procedure TTrivialXmlWriter.WriteEndElement;
begin
  fWriter.Write('</' + fNodes.Pop + '>');
end;

procedure TTrivialXmlWriter.WriteStartElement(const sName: string);
begin
  fWriter.Write('<' + sName + '>');
  fNodes.Push (sname);
end;

procedure TTrivialXmlWriter.WriteString(const sValue: string);
begin
  fWriter.Write(sValue);
end;

end.
