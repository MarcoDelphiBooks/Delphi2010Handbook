unit DsnapMethodsClient_ClientForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DbxDatasnap, DB, SqlExpr, DsnapMethodsClient_Proxy,
  StdCtrls, Spin, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

type
  TFormDsmcClient = class(TForm)
    SQLConnection1: TSQLConnection;
    btnEcho: TButton;
    Edit1: TEdit;
    btnFormSet: TButton;
    btnFormGet: TButton;
    SpinEdit1: TSpinEdit;
    btnToString: TButton;
    lblToString: TLabel;
    btnPrimes: TButton;
    SpinEdit2: TSpinEdit;
    lblPrimes: TLabel;
    lblGet: TLabel;
    btnPrimesTh: TButton;
    lblPrimesTh: TLabel;
    btnPrimesCall: TButton;
    SpinEdit3: TSpinEdit;
    lblPrimesCall: TLabel;
    procedure btnEchoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFormSetClick(Sender: TObject);
    procedure btnFormGetClick(Sender: TObject);
    procedure btnToStringClick(Sender: TObject);
    procedure btnPrimesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimesThClick(Sender: TObject);
    procedure btnPrimesCallClick(Sender: TObject);
    procedure lblPrimesCallClick(Sender: TObject);
  private
    SimpleServer: TSimpleServerClassClient;
    StorageServer: TStorageServerClassClient;
    procedure InitStorageServer;
  public
    function ToString: string; override;
  end;

implementation

{$R *.dfm}

uses
  DBXJson;

type
  TPrimesClientThread = class (TThread)
  private
    FMaxValue: Integer;
    FSimpleServer: TSimpleServerClassClient;
    FCallingForm: TFormDsmcClient;
  protected
    procedure Execute; override;
  public
    constructor Create (MaxValue: Integer;
      SimpleServer: TSimpleServerClassClient;
      CallingForm: TFormDsmcClient);
  end;


procedure TFormDsmcClient.btnEchoClick(Sender: TObject);
begin
  if not Assigned (SimpleServer) then
    SimpleServer := TSimpleServerClassClient.Create (
      SQLConnection1.DBXConnection);
  Edit1.Text := SimpleServer.Echo(Edit1.Text);
end;

procedure TFormDsmcClient.btnFormGetClick(Sender: TObject);
begin
  InitStorageServer;
  lblGet.Caption := IntToStr (StorageServer.GetValue);
end;

procedure TFormDsmcClient.InitStorageServer;
begin
  if not Assigned(StorageServer) then
    StorageServer := TStorageServerClassClient.Create(
      SQLConnection1.DBXConnection);
end;

procedure TFormDsmcClient.lblPrimesCallClick(Sender: TObject);
begin
  (Sender as TLabel).Tag := 1;
end;

function TFormDsmcClient.ToString: string;
begin
  InitStorageServer;
  Result := StorageServer.ToString;
end;

procedure TFormDsmcClient.btnFormSetClick(Sender: TObject);
begin
  InitStorageServer;
  StorageServer.SetValue(SpinEdit1.Value);
end;

type
  TMyCallBack = class(TDBXCallback)
  private
    fLabel: TLabel;
  public
    constructor Create (aLabel: TLabel);
    function Execute(const Arg: TJSONValue): TJSONValue; override;
  end;

procedure TFormDsmcClient.btnPrimesCallClick(Sender: TObject);
var
  aCallBack: TMyCallBack;
begin
  if not Assigned (SimpleServer) then
    SimpleServer := TSimpleServerClassClient.Create (
      SQLConnection1.DBXConnection);
  lblPrimesCall.Tag := 0; // reset
  aCallBack := TMyCallBack.Create (lblPrimesCall);
  lblPrimesCall.Caption := IntToStr (
    SimpleServer.SlowPrimeCallback (SpinEdit3.Value,
      aCallBack));
end;

procedure TFormDsmcClient.btnPrimesClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not Assigned (SimpleServer) then
      SimpleServer := TSimpleServerClassClient.Create (
        SQLConnection1.DBXConnection);
    lblPrimes.Caption := IntToStr (
      SimpleServer.SlowPrime (SpinEdit2.Value));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormDsmcClient.btnPrimesThClick(Sender: TObject);
begin
  // btnPrimesTh.Enabled := False;
  if not Assigned (SimpleServer) then
    SimpleServer := TSimpleServerClassClient.Create (
      SQLConnection1.DBXConnection);
  TPrimesClientThread.Create(
    SpinEdit2.Value, SimpleServer, self);
end;

procedure TFormDsmcClient.btnToStringClick(Sender: TObject);
begin
  InitStorageServer;
  lblToString.Caption := StorageServer.ToString;
end;

procedure TFormDsmcClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // destroy when closed
  Action := caFree;
  SimpleServer.Free;
end;

procedure TFormDsmcClient.FormCreate(Sender: TObject);
begin
  try
    SQLConnection1.Open;
  except
    ShowMessage ('Run the server and restart the client application');
  end;
end;

{ TPrimesClientThread }

constructor TPrimesClientThread.Create(
  MaxValue: Integer; SimpleServer: TSimpleServerClassClient;
  CallingForm: TFormDsmcClient);
begin
  FSimpleServer := SimpleServer;
  FMaxValue := MaxValue;
  FCallingForm := CallingForm;
  FreeOnTerminate := True;
  inherited Create (False);
end;

procedure TPrimesClientThread.Execute;
var
  nResult: Integer;
begin
  nResult := FSimpleServer.SlowPrime(FMaxValue);
  Synchronize (procedure ()
    begin
      FCallingForm.lblPrimesTh.Caption := IntToStr (nResult);
      // FCallingForm.btnPrimesTh.Enabled := True;
    end);
end;

{ TMyCallBack }

constructor TMyCallBack.Create(aLabel: TLabel);
begin
  fLabel := aLabel;
end;

function TMyCallBack.Execute(const Arg: TJSONValue): TJSONValue;
begin
  fLabel.Caption := Arg.ToString;
  Application.ProcessMessages;
  if fLabel.Tag = 0 then
    Result := TJSONTrue.Create
  else
    Result := TJSONFalse.Create;
end;

end.
