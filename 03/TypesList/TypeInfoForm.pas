unit TypeInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Rtti;

type
  TFormTypeInfo = class(TForm)
    HeaderControl1: THeaderControl;
    ListProperties: TListBox;
    ListMethods: TListBox;
    ListFields: TListBox;
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTypeInformation (aType: TRttiType);

implementation

{$R *.dfm}

uses
  TypInfo;

function VisibilityToken (mv: TMemberVisibility): string;
begin
  case mv of
    mvPrivate: Result := '[pri]';
    mvProtected: Result := '[pro]';
    mvPublic: Result := '[pub]';
    mvPublished: Result := '[pbl]';
  else
    Result := '[und]';
  end;
end;

procedure ShowTypeInformation (aType: TRttiType);
var
  FormTypeInfo: TFormTypeInfo;
  aProperty: TRttiProperty;
  aMethod: TRttiMethod;
  aField: TRttiField;
begin
  FormTypeInfo := TFormTypeInfo.Create(nil);
  try
    FormTypeInfo.Caption := FormTypeInfo.Caption + ' - ' + aType.QualifiedName;
    for aProperty in atype.GetProperties do
      FormTypeInfo.ListProperties.Items.Add (aProperty.Name + ': ' +
        aProperty.PropertyType.Name + ' ' + VisibilityToken (aProperty.Visibility));
    for aMethod in atype.GetMethods do
      FormTypeInfo.ListMethods.Items.Add (aMethod.Name + ' ' +
        VisibilityToken (aMethod.Visibility));
    for aField in aType.GetFields do
      FormTypeInfo.ListFields.Items.Add (aField.Name + ': ' +
        aField.FieldType.Name + ' ' + VisibilityToken (aField.Visibility));
    FormTypeInfo.ShowModal;
  finally
    FormTypeInfo.Free;
  end;
end;


procedure TFormTypeInfo.HeaderControl1SectionResize(
  HeaderControl: THeaderControl; Section: THeaderSection);
begin
  case Section.Index of
    0: ListProperties.Width := Section.Width;
    1: ListMethods.Width := Section.Width;
    2: ListFields.Width := Section.Width;
  end;
end;

end.
