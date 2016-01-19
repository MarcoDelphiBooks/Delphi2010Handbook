unit DSnapGateway_WebModule;

interface

uses
  SysUtils, Classes, HTTPApp, DSHTTP, DSHTTPCommon, DSHTTPWebBroker, DSServer,
  DSCommonServer;

type
  TWebModule3 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    procedure WebModule3DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule3: TWebModule3;

implementation

uses WebReq;

{$R *.dfm}

procedure TWebModule3.WebModule3DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html><heading/><body>DataSnap Server</body></html>';
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule3;

end.




