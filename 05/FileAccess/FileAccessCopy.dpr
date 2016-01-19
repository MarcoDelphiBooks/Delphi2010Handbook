program FileAccessCopy;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes;

var
  strIn, strOut: TFileStream;

begin
  try
    if ParamCount <> 2 then
    begin
      writeln ('Two parameters required');
      Exit;
    end;

    writeln ('reading... ' + ParamStr (1));
    strIn := TFileStream.Create (ParamStr (1), fmOpenRead);
    try
      writeln ('writing... ' + ParamStr (2));
      if FileExists (ParamStr (2)) then
        strOut := TFileStream.Create (ParamStr (2), fmOpenWrite)
      else
        strOut := TFileStream.Create (ParamStr (2), fmCreate);
      try
        strOut.CopyFrom(strIn, strIn.Size);
      finally
        strOut.Free;
      end;
    finally
      strIn.Free;
    end;
    writeln ('Operation completed. Press Enter to close.');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  readln;
end.
