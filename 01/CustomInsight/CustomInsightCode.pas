unit CustomInsightCode;

interface

procedure Register;

implementation

uses
  Classes, Forms, SysUtils, ToolsAPI, Types, Graphics, Dialogs;

type
  TIDEInsightTest = class(TInterfacedObject, INTAIDEInsightItem, IOTANotifier)
  private
    fName: string;
    fDescription: string;
  public
    constructor Create (const aName: string);
    { INTAIDEInsightItem }
    function DrawText(Canvas: TCanvas; Rect: TRect; var DrawDefault: Boolean;
      DoDraw: Boolean = True): Integer;
    procedure Execute;
    function GetDescription: string;
    function GetDescriptionSearchable: Boolean;
    function GetGlyph(Bitmap: TBitmap): Boolean;
    function GetSticky: Boolean;
    function GetTitle: string;
    function GetVisible: Boolean;
    procedure Update;
    { IOTANotifier }
//    procedure EvaluteComplete(const ExprStr: string; const ResultStr: string;
//      CanModify: Boolean; ResultAddress: Cardinal; ResultSize: Cardinal;
//      ReturnCode: Integer);
//    procedure ModifyComplete(const ExprStr: string; const ResultStr: string;
//      ReturnCode: Integer);
//    procedure ThreadNotify(Reason: TOTANotifyReason);
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
  end;

var
  firstIDEInsight: INTAIDEInsightItem;

procedure Register;
begin
  firstIDEInsight := TIDEInsightTest.Create('First Test');
  (BorlandIDEServices as IOTAIDEInsightService).AddItem(
     firstIDEInsight, 'Cantools');
end;

{ TIDEInsightTest }

procedure TIDEInsightTest.AfterSave;
begin
  // nothing needed
end;

procedure TIDEInsightTest.BeforeSave;
begin
  // nothing needed
end;

constructor TIDEInsightTest.Create(const aName: string);
begin
  fName := aName;
  fDescription := 'Sample IDE Insight entry';
end;

procedure TIDEInsightTest.Destroyed;
begin
  // nothing needed
end;

function TIDEInsightTest.DrawText(Canvas: TCanvas; Rect: TRect;
  var DrawDefault: Boolean; DoDraw: Boolean): Integer;
begin
  Result := 0;
  DrawDefault := True;
end;

procedure TIDEInsightTest.Execute;
begin
  ShowMessage ('Got it: ' + fName);
end;

function TIDEInsightTest.GetDescription: string;
begin
  Result := fDescription;
end;

function TIDEInsightTest.GetDescriptionSearchable: Boolean;
begin
  Result := False;
end;

function TIDEInsightTest.GetGlyph(Bitmap: TBitmap): Boolean;
begin
  Result := False;
end;

function TIDEInsightTest.GetSticky: Boolean;
begin
  Result := True;
end;

function TIDEInsightTest.GetTitle: string;
begin
  Result := fName;
end;

function TIDEInsightTest.GetVisible: Boolean;
begin
  Result := True;
end;

procedure TIDEInsightTest.Modified;
begin
  // nothing needed
end;

procedure TIDEInsightTest.Update;
begin
  fDescription := 'Sample IDE Insight entry, last updated at: ' + TimeToStr (Now);
end;

procedure RemoveIDEInsight;
begin
  (BorlandIDEServices as IOTAIDEInsightService).RemoveItem (
     firstIDEInsight);
  firstIDEInsight := nil; // it is an interface
end;

initialization
finalization
  RemoveIDEInsight;


end.
