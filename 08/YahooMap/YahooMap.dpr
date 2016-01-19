program YahooMap;

uses
  Forms,
  YahooMapForm in 'YahooMapForm.pas' {FormMap};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMap, FormMap);
  Application.Run;
end.
