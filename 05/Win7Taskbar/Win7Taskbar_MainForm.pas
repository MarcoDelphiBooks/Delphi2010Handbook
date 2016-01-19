unit Win7Taskbar_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList;

type
  TWin7TaskForm = class(TForm)
    ProgressBar1: TProgressBar;
    btnProgress: TButton;
    ImageList1: TImageList;
    btnOverlayIcon: TButton;
    btnNoOverlay: TButton;
    btnTaskButtons: TButton;
    procedure btnProgressClick(Sender: TObject);
    procedure btnOverlayIconClick(Sender: TObject);
    procedure btnNoOverlayClick(Sender: TObject);
    procedure btnTaskButtonsClick(Sender: TObject);
  protected
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
  public
    procedure ThumbClicked (iButton: Integer);
  end;

var
  Win7TaskForm: TWin7TaskForm;

implementation

{$R *.dfm}

uses
  ComObj, ShlObj, TaskbarSupportUnit;

function GetTaskBarEntryHandle: THandle;
begin
  if not Application.MainFormOnTaskBar then
    Result := Application.Handle
  else
    Result := Application.MainForm.Handle;
end;

procedure TWin7TaskForm.btnProgressClick(Sender: TObject);
var
  I: Integer;
  FormHandle: THandle;
begin
  FormHandle := GetTaskBarEntryHandle;
  TaskbarSupport.TaskbarList3.SetProgressState(FormHandle, TBPF_NORMAL);

  for I := 1 to 100 do
  begin
    ProgressBar1.Position := I;
    TaskbarSupport.TaskbarList3.SetProgressValue(FormHandle, I, 100);
    Application.ProcessMessages;
    Sleep (100);
  end;

  TaskbarSupport.TaskbarList3.SetProgressState(FormHandle, TBPF_NOPROGRESS);
end;

procedure TWin7TaskForm.btnNoOverlayClick(Sender: TObject);
begin
  TaskbarSupport.TaskbarList3.SetOverlayIcon(GetTaskBarEntryHandle, 0, nil);
end;

procedure TWin7TaskForm.btnOverlayIconClick(Sender: TObject);
var
  anIcon: TIcon;
begin
  anIcon := TIcon.Create;
  try
    ImageList1.GetIcon(Random(3), anIcon);
    TaskbarSupport.TaskbarList3.SetOverlayIcon(GetTaskBarEntryHandle,
      anIcon.Handle, PChar('MyIcon'));
  finally
    anIcon.Free;
  end;
end;

procedure TWin7TaskForm.btnTaskButtonsClick(Sender: TObject);
var
  Buttons: array of TThumbButton;
  I: Integer;
begin
  SetLength(Buttons, 3);
  for I := 0 to 2 do
  begin
    Buttons[I].iId := I;
    Buttons[I].iBitmap := I;
    Buttons[I].dwMask := THB_FLAGS or THB_BITMAP or THB_TOOLTIP;
    Buttons[I].dwFlags :=  THBF_ENABLED or THBF_NOBACKGROUND or THBF_DISMISSONCLICK;
    StrCopy (Buttons[I].szTip, PChar('button ' + IntToStr (I)));
  end;
  TaskbarSupport.TaskbarList3.ThumbBarSetImageList(GetTaskBarEntryHandle, ImageList1.Handle);
  TaskbarSupport.TaskbarList3.ThumbBarAddButtons(GetTaskBarEntryHandle, Length(Buttons), @Buttons[0]);
end;

procedure TWin7TaskForm.ThumbClicked(iButton: Integer);
begin
  ShowMessage ('You clicked on button ' + IntToStr (iButton));
end;

procedure TWin7TaskForm.WMCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = THBN_CLICKED then
    ThumbClicked (Message.ItemID);
  inherited;
end;

end.
