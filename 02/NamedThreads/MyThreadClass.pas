unit MyThreadClass;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF};

type
  TMyThread = class(TThread)
  protected
    procedure Execute; override;
  end;

function CurrentTimeAsStr: string;

implementation

uses
  NamedThreadsMainForm, SysUtils;

function CurrentTimeAsStr: string;
begin
  Result := TimeToStr (Now);
end;

{ TMyThread }

procedure TMyThread.Execute;
var
  strTime: String;
begin
  NameThreadForDebugging('MyThread');
  FreeOnTerminate := True;
  { Place thread code here }
  while not Terminated do
  begin
    sleep (1000);
    strTime := CurrentTimeAsStr; // function executed in thread context
    Synchronize(procedure ()
    begin
      FormNamedThreads.Log ('MyThread: ' + strTime);
    end)
  end;
end;

end.
