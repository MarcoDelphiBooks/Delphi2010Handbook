unit RtlListsMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormRtlLists = class(TForm)
    btnSortListAnon: TButton;
    Memo1: TMemo;
    btnIndexOfItem: TButton;
    Button1: TButton;
    procedure btnSortListAnonClick(Sender: TObject);
    procedure btnIndexOfItemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormRtlLists: TFormRtlLists;

implementation

{$R *.dfm}

uses
  Generics.Collections;

procedure TFormRtlLists.btnSortListAnonClick(Sender: TObject);
var
  aList: TList;
  I: Integer;
begin
  aList := TList.Create;
  try
    for I := 1 to 50 do
      aList.Add(Pointer (Random (1000)));
    // show first ten elements
    Log ('plain');
    for I := 0 to 9 do
      Log (IntToStr (Integer (aList[I])));
    // now sort them
    aList.SortList (
      function (Item1, Item2: Pointer): Integer
      begin
        if Integer(Item1) > Integer (Item2) then
          Result := 1
        else if Integer(Item1) < Integer (Item2) then
          Result := -1
        else
          Result := 0;
      end);
    // show first ten elements, again
    Log ('sorted');
    for I := 0 to 9 do
      Log (IntToStr (Integer (aList[I])));
  finally
    aList.Free;
  end;
end;

procedure TFormRtlLists.Button1Click(Sender: TObject);
var
  aList: TList<Integer>;
  I: Integer;
begin
  aList := TList<Integer>.Create;
  try
    for I := 1 to 50 do
      aList.Add(I);
    aList.Exchange (1, 2);
    Log('First is ' + IntToStr (aList.First));
    Log('Last is ' + IntToStr (aList.Last));
  finally
    aList.Free;
  end;
end;

procedure TFormRtlLists.btnIndexOfItemClick(Sender: TObject);
var
  aList: TList;
  I: Integer;
begin
  aList := TList.Create;
  try
    for I := 1 to 50 do
      aList.Add(Pointer (I));
    aList.Add (Pointer (1));
    Log ('IndexOf: ' + IntToStr (aList.IndexOf(Pointer (1))));
    Log ('IndexOfItem (FromEnd): ' + IntToStr (aList.IndexOfItem(Pointer (1), FromEnd)));
  finally
    aList.Free;
  end;
end;

procedure TFormRtlLists.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
