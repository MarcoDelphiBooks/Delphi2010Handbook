unit TypesListMainForm;

{.$RTTI EXPLICIT METHODS([]) FIELDS([]) PROPERTIES([])}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Rtti;

type
  TFormTypesList = class(TForm)
    btnTypesList: TButton;
    ListBox1: TListBox;
    TreeView1: TTreeView;
    btnHierarchy: TButton;
    btnPackages: TButton;
    Button1: TButton;
    StatusBar1: TStatusBar;
    procedure btnTypesListClick(Sender: TObject);
    procedure btnHierarchyClick(Sender: TObject);
    procedure btnPackagesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
  private
    function AddTypeToTree(atype: TRttiType): TTreeNode;
    function GetNodeFromTree(const basetype: string): TTreeNode;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTypesList: TFormTypesList;

implementation

uses
  TypInfo, TypeInfoForm;

{$R *.dfm}

function TFormTypesList.GetNodeFromTree (const basetype: string): TTreeNode;
var
  Node1: TTreeNode;
begin
  Result := nil; // not found
  // find the node in the tree
  Node1 := TreeView1.Items.GetFirstNode;
  while Node1 <> nil do
  begin
    if Node1.Text = basetype then
      Exit (Node1);
    Node1 := Node1.GetNext;
  end;
end;

procedure TFormTypesList.TreeView1DblClick(Sender: TObject);
var
  context: TRttiContext;
  atype: TRttiType;
begin
  if TreeView1.Selected = nil then
    Exit;
  aType := context.FindType(TreeView1.Selected.Text);
  if not Assigned (aType) then
    raise Exception.Create('Type not found: ' + TreeView1.Selected.Text);
  TypeInfoForm.ShowTypeInformation (aType);
end;

function TFormTypesList.AddTypeToTree (atype: TRttiType): TTreeNode;
var
  ParentNode: TTreeNode;
begin
  // already there?
  Result := GetNodeFromTree (atype.QualifiedName);

  if Result = nil then
  begin
    if atype.BaseType = nil then
      // add root node
      ParentNode := nil
    else
      // add the base class if not there
      ParentNode := AddTypeToTree (atype.BaseType);
    // now add the child class
    Result := TreeView1.Items.AddChild (ParentNode, atype.QualifiedName);
  end;
end;

procedure TFormTypesList.btnHierarchyClick(Sender: TObject);
var
  context: TRttiContext;
  types: TArray<TRttiType>;
  atype: TRttiType;
begin
  // context := TRttiContext.Create;
  types := context.GetTypes;
  for atype in types do
  begin
    if aType.IsInstance then
      AddTypeToTree (atype);
  end;
  TreeView1.FullExpand;
end;

procedure TFormTypesList.btnPackagesClick(Sender: TObject);
var
  aContext: TRttiContext;
  aPackage: TRttiPackage;
  aType: TRttiType;
begin
  ListBox1.Clear;
  ListBox1.Sorted := False;
  for aPackage in aContext.GetPackages do
  begin
    ListBox1.Items.Add('PACKAGE ' + aPackage.Name);
    for aType in aPackage.GetTypes do
     if aType.IsInstance then
     begin
       ListBox1.Items.Add('   - ' + aType.QualifiedName);
     end;
  end;
end;

procedure TFormTypesList.btnTypesListClick(Sender: TObject);
var
  aContext: TRttiContext;
  theTypes: TArray<TRttiType>;
  aType: TRttiType;
  nFound: Integer;
begin
//  aContext := TRttiContext.Create;
//  try
    ListBox1.Clear;
    nFound := 0;
    theTypes := aContext.GetTypes;
    for aType in theTypes do
      if aType.IsInstance and aType.IsPublicType then
      begin
        ListBox1.Items.Add(aType.QualifiedName);
        Inc (nFound);
      end;
    ListBox1.Sorted := True;
    StatusBar1.SimpleText := 'Types found: ' + IntToStr (nFound);
//  finally
//    aContext.Free;
//  end;
end;

function GetThisType (aClass: TClass): TRttiType;
var
  aContext: TRttiContext;
begin
  Result := aContext.GetType(aClass);
end;

procedure TFormTypesList.Button1Click(Sender: TObject);
var
  aType: TRttiType;
begin
  aType := GetThisType (TForm);
  // the following would cause a memory error!
  ShowMessage (aType.QualifiedName)
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
