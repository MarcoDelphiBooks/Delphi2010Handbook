unit DataGestures_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, DBActns, ActnList, ComCtrls, GestureMgr, ToolWin, ImgList,
  Grids, DBGrids, DB, DBClient;

type
  TDBGrid = class (DBGrids.TDBGrid)
  public
    function Focused: Boolean; override;
  end;

  TDataGesturesForm = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    GestureManager1: TGestureManager;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    FileExit1: TFileExit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataGesturesForm: TDataGesturesForm;

implementation

{$R *.dfm}

{ TDBGrid }

function TDBGrid.Focused: Boolean;
begin
  Result := False;
end;

procedure TDataGesturesForm.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
