unit ServerContainerUnit1;

interface

uses
  SysUtils, Classes, 
  DSHTTPCommon, DSHTTP,
  DSServer, DSCommonServer; 

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSHTTPServiceAuthenticationManager1: TDSHTTPServiceAuthenticationManager;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSHTTPServiceAuthenticationManager1HTTPAuthenticate(
      Sender: TObject; const Protocol, Context, User, Password: string;
      var valid: Boolean);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

implementation

uses Windows, ServerMethodsUnit1;

{$R *.dfm}

procedure TServerContainer1.DSHTTPServiceAuthenticationManager1HTTPAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean);
begin
  valid := (User = 'marco') and (password = '123');
end;

procedure TServerContainer1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

procedure RunDSServer;
var
  LModule: TServerContainer1;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
begin
  Writeln(Format('Starting %s', [TServerContainer1.ClassName]));
  LModule := TServerContainer1.Create(nil);
  try
    LModule.DSServer1.Start;
    try
      Writeln('Press ESC to stop the server');
      LHandle := GetStdHandle(STD_INPUT_HANDLE);
      while True do
      begin
        Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
        if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
          break;
      end;
    finally
      LModule.DSServer1.Stop;
    end;
  finally
    LModule.Free;
  end;
end;

end.




