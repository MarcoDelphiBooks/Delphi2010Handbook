unit TaskbarSupportUnit;

interface

uses
  Classes, SysUtils, ComObj, ShlObj, ObjectArray;

type
  TTaskBarSupport = class
  public
    TaskbarList: ITaskbarList;
    TaskbarList2: ITaskbarList2;
    TaskbarList3: ITaskbarList3;
  public
    constructor Create;
    procedure InitTaskbarSupport;
  end;

var
  TaskbarSupport: TTaskBarSupport;

implementation

{ TTaskBarSupport }

constructor TTaskBarSupport.Create;
begin
  InitTaskbarSupport;
end;

procedure TTaskBarSupport.InitTaskbarSupport;
begin
  TaskbarList := CreateComObject(CLSID_TaskbarList) as ITaskbarList;
  TaskbarList.HrInit;
  Supports(TaskbarList, IID_ITaskbarList2, TaskbarList2);
  Supports(TaskbarList, IID_ITaskbarList3, TaskbarList3);
end;

initialization
  TaskbarSupport := TTaskBarSupport.Create;

finalization
  TaskbarSupport.Free;

end.
