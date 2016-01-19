unit DbGridFix;

interface

uses
  DBGrids;

type
  TDBGrid = class (DbGrids.TDBGrid)
  protected
    procedure Paint; override;
  end;

implementation

{ TDBGrid }

uses
  Rtti;

procedure TDBGrid.Paint;
var
  oldEditorMode: TValue;
  context: TRttiCOntext;
  editorModeField: TRttiField;
begin
  editorModeField := context.GetType(TDbGrid).GetField('FEditorMode');
  if Assigned (editorModeField) then
  begin
    oldEditorMode := editorModeField.GetValue(self);
    editorModeField.SetValue(self, TValue.From(False));
  end;

  // now paint
  inherited;

  if Assigned (editorModeField) then
    editorModeField.SetValue(self, oldEditorMode);
end;

end.
