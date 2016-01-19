program GeoLocation;

uses
  Forms,
  GeoLocationForm in 'GeoLocationForm.pas' {FormMap};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMap, FormMap);
  Application.Run;
end.
