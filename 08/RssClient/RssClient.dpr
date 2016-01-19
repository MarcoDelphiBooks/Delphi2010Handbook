program RssClient;

uses
  Forms,
  RssClientForm in 'RssClientForm.pas' {RssForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRssForm, RssForm);
  Application.Run;
end.
