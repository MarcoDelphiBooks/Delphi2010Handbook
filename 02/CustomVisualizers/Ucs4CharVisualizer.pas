unit Ucs4CharVisualizer;

interface

procedure Register;

implementation

uses
  Classes, Forms, SysUtils, ToolsAPI, Character;

type
  TDebuggerUcs4CharVisualizer = class (TInterfacedObject, IOTADebuggerVisualizer,
    IOTADebuggerVisualizerValueReplacer, IOTAThreadNotifier)
  public
    { IOTADebuggerVisualizer }
    function GetSupportedTypeCount: Integer;
    procedure GetSupportedType(Index: Integer; var TypeName: string;
      var AllDescendants: Boolean);
    function GetVisualizerIdentifier: string;
    function GetVisualizerName: string;
    function GetVisualizerDescription: string;
    { IOTADebuggerVisualizerValueReplacer }
    function GetReplacementValue(const Expression, TypeName, EvalResult: string): string;
    { IOTAThreadNotifier }
    procedure EvaluteComplete(const ExprStr: string; const ResultStr: string;
      CanModify: Boolean; ResultAddress: Cardinal; ResultSize: Cardinal;
      ReturnCode: Integer);
    procedure ModifyComplete(const ExprStr: string; const ResultStr: string;
      ReturnCode: Integer);
    procedure ThreadNotify(Reason: TOTANotifyReason);
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
  end;

{ TDebuggerUcs4CharVisualizer }

procedure TDebuggerUcs4CharVisualizer.AfterSave;
begin
  // don't care about this notification
end;

procedure TDebuggerUcs4CharVisualizer.BeforeSave;
begin
  // don't care about this notification
end;

procedure TDebuggerUcs4CharVisualizer.Destroyed;
begin
  // don't care about this notification
end;

procedure TDebuggerUcs4CharVisualizer.EvaluteComplete(const ExprStr,
  ResultStr: string; CanModify: Boolean; ResultAddress, ResultSize: Cardinal;
  ReturnCode: Integer);
begin
  // don't care about this notification
//  FCompleted := True;
//  if ReturnCode = 0 then
//    FDeferredResult := ResultStr;
end;

function TDebuggerUcs4CharVisualizer.GetReplacementValue(const Expression,
  TypeName, EvalResult: string): string;
var
  ch: UCS4Char;
begin
  ch := StrToIntDef (EvalResult, 0);
  if (ch <> 0) and not ((ch >= $D800) and (ch <= $DFFF)) and
    (ch < $10FFF) then
    Result := Character.ConvertFromUtf32 (ch)
  else
    Result := '<unassigned>';
end;

procedure TDebuggerUcs4CharVisualizer.GetSupportedType(Index: Integer;
  var TypeName: string; var AllDescendants: Boolean);
begin
  AllDescendants := False;
  TypeName := 'UCS4Char';
end;

function TDebuggerUcs4CharVisualizer.GetSupportedTypeCount: Integer;
begin
  Result := 1;
end;

function TDebuggerUcs4CharVisualizer.GetVisualizerDescription: string;
begin
  Result := 'Displays the Unicode string for a Ucs4Char value';
end;

function TDebuggerUcs4CharVisualizer.GetVisualizerIdentifier: string;
begin
  Result := ClassName;
end;

function TDebuggerUcs4CharVisualizer.GetVisualizerName: string;
begin
  Result := 'Ucs4Char Visualizer for Delphi';
end;

procedure TDebuggerUcs4CharVisualizer.Modified;
begin
  // don't care about this notification
end;

procedure TDebuggerUcs4CharVisualizer.ModifyComplete(const ExprStr,
  ResultStr: string; ReturnCode: Integer);
begin
  // don't care about this notification
end;

procedure TDebuggerUcs4CharVisualizer.ThreadNotify(Reason: TOTANotifyReason);
begin
  // don't care about this notification
end;

var
  Ucs4CharVis: IOTADebuggerVisualizer;

procedure Register;
var
  DebuggerServices: IOTADebuggerServices;
begin
  Ucs4CharVis := TDebuggerUcs4CharVisualizer.Create;
  if Supports(BorlandIDEServices, IOTADebuggerServices, DebuggerServices) then
    DebuggerServices.RegisterDebugVisualizer(Ucs4CharVis);
end;

procedure RemoveVisualizer;
var
  DebuggerServices: IOTADebuggerServices;
begin
  if Supports(BorlandIDEServices, IOTADebuggerServices, DebuggerServices) then
  begin
    DebuggerServices.UnregisterDebugVisualizer(Ucs4CharVis);
    FreeAndNil (Ucs4CharVis);
  end;
end;

initialization
finalization
  RemoveVisualizer;

end.
