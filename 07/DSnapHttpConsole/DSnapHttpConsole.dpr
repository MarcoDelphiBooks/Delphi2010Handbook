program DSnapHttpConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas',
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.




