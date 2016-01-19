unit NoInspectorDescriptionPane;

interface

procedure Register;

implementation

uses
  Forms, Classes, Controls, Dialogs;

function FindObjectInspector: TComponent;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms [I].ClassName = 'TPropertyInspector' then
       Exit (Screen.Forms [I]);
end;

procedure Register;
var
  aComp: TComponent;
begin
  aComp := FindObjectInspector;
  if Assigned (aComp) then
  begin
    aComp := aComp.FindComponent('DescriptionPane');
    if Assigned (aComp) then
    begin
      (aComp as TControl).Height := 0;
    end;
  end;
end;

end.
