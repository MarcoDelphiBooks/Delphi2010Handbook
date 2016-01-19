unit KeyboardTest_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Keyboard, StdCtrls, ExtCtrls;

type
  TKeyboardForm = class(TForm)
    TouchKeyboard1: TTouchKeyboard;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KeyboardForm: TKeyboardForm;

implementation

{$R *.dfm}

procedure TKeyboardForm.btnTestClick(Sender: TObject);
var
  code: UINT;
begin
  LoadkeyboardLayout ('00000409', KLF_ACTIVATE);

  code := MapVirtualKey(43, MAPVK_VSC_TO_VK);
  ShowMessage (inttostr (code));
end;

end.
