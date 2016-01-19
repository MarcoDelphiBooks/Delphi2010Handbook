unit saxphilo;

interface

uses
  AdomCore_4_3, classes, strutils;

type
  TDataSaxHandler = class (TXmlStandardHandler)
  protected
    stack: TStringList;
    strCurrent: string;
  public
    constructor Create(aowner: TComponent); override;
    procedure ProcessSignal(const Signal: TXmlSignal); override;
    destructor Destroy; override;
  end;

implementation

uses
  LargeXmlForm, saxform;

{ TDataSaxHandler }

constructor TDataSaxHandler.Create(aowner: TComponent);
begin
  inherited;
  stack := tstringlist.create;
end;

destructor TDataSaxHandler.Destroy;
begin
  stack.Free;
  inherited;
end;

procedure TDataSaxHandler.ProcessSignal(const Signal: TXmlSignal);
var
  tagname: string;
begin
  if Signal is TXmlStartElementSignal then
  begin
    stack.Add (TXmlStartElementSignal(Signal).TagName);
    if TXmlStartElementSignal(Signal).TagName = 'employeeData' then
      Form1.clientdataset2.Insert;
    strCurrent := '';
  end
  else if Signal is TXmlEndElementSignal then
  begin
    if TXmlEndElementSignal(Signal).TagName = 'employeeData' then
      Form1.clientdataset2.Post;
    if stack.Count > 2 then
    begin
      Form1.ClientDataSet2.Edit;
      Form1.ClientDataSet2.FieldByName (
        TXmlEndElementSignal(Signal).TagName).AsString := strCurrent;
    end;
    stack.Delete (stack.Count - 1);
  end
  else if Signal is TXmlPCDATASignal then
  begin
    strCurrent := strCurrent + RemoveWhites(
      TXmlPCDATASignal(Signal).Data);
  end;
end;

end.
