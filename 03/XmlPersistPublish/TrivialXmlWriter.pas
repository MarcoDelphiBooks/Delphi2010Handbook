unit TrivialXmlWriter;

interface

uses
  Classes, Generics.Collections;

type
  TTrivialXmlWriter = class
  private
    fWriter: TTextWriter;
    fNodes: TStack<string>;
    fOwnsTextWriter: Boolean;
  public
    constructor Create (aWriter: TTextWriter); overload;
    constructor Create (aStream: TStream); overload;
    destructor Destroy; override;
    procedure WriteStartElement (const sName: string);
    procedure WriteEndElement (fIndent: Boolean = False);
    procedure WriteString (const sValue: string);
    procedure WriteObjectPublished (AnObj: TObject);
    function Indentation: string;
  end;

implementation

{ TTrivialXmlWriter }

uses
  TypInfo, SysUtils;

constructor TTrivialXmlWriter.Create(aWriter: TTextWriter);
begin
  fWriter := aWriter;
  fNodes := TStack<string>.Create;
end;

constructor TTrivialXmlWriter.Create(aStream: TStream);
begin
  fWriter := TStreamWriter.Create (aStream);
  Create (fWriter); // call first constructor
  fOwnsTextWriter := True;
end;

destructor TTrivialXmlWriter.Destroy;
begin
  while fNodes.Count > 0 do
    WriteEndElement;
  fNodes.Free;
  if fOwnsTextWriter then
    FreeAndNil (fWriter);
  inherited;
end;

function TTrivialXmlWriter.Indentation: string;
begin
  Result := StringOfChar (' ', fNodes.Count * 2)
end;

procedure TTrivialXmlWriter.WriteEndElement (fIndent: Boolean);
var
  strNode: string;
begin
  strNode := fNodes.Pop;
  if fIndent then
    fWriter.Write(Indentation);
  fWriter.Write ('</' + strNode + '>' + sLineBreak);
end;

procedure TTrivialXmlWriter.WriteObjectPublished(AnObj: TObject);
var
  nProps, i: Integer;
  PropList: PPropList;
  internalObject: TObject;
  strPropName: string;
begin
  WriteString (sLineBreak); // new line
  // get list of properties
  nProps := GetTypeData(AnObj.ClassInfo)^.PropCount;
  if nProps = 0 then
    Exit;

  GetMem(PropList, nProps * SizeOf(Pointer));
  try
    GetPropInfos(AnObj.ClassInfo, PropList);
    for i := 0 to nProps - 1 do
    begin
      strPropName := UTF8ToString (PropList[i].Name);
      case PropList[i].PropType^.Kind of

        tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
          tkString, tkUString, tkSet, tkWChar, tkLString, tkWString, tkInt64:
        begin
          WriteStartElement (strPropName);
          WriteString (GetPropValue(AnObj, strPropName));
          WriteEndElement;
        end;

        tkClass:
        begin
          internalObject := GetObjectProp(AnObj, strPropName);
          if Assigned(internalObject) and // skip if nil
            internalObject.InheritsFrom(TPersistent) then
          begin
            // recurse in subclass
            WriteStartElement (strPropName);
            WriteObjectPublished (internalObject as TPersistent);
            WriteEndElement (True);
          end;
        end; // tkClass
      end; // case
    end; // for
  finally
    FreeMem(PropList);
  end;
end;

procedure TTrivialXmlWriter.WriteStartElement(const sName: string);
begin
  fWriter.Write (Indentation + '<' + sName + '>');
  fNodes.Push (sname);
end;

procedure TTrivialXmlWriter.WriteString(const sValue: string);
begin
  fWriter.Write (sValue);
end;

end.
