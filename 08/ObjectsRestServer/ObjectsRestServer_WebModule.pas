unit ObjectsRestServer_WebModule;

interface

uses
  SysUtils, Classes, HTTPApp, DSHTTP, DSHTTPCommon, DSHTTPWebBroker, DSServer,
  DSCommonServer;

type
  TWebModule2 = class(TWebModule)
    DSServer1: TDSServer;
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure WebModule2DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule2: TWebModule2;

implementation

uses WebReq, ObjectsRestServer_Classes;

{$R *.dfm}

procedure TWebModule2.WebModule2DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  strRead: TStreamReader;
begin
  strRead := TStreamReader.Create('jRestClient.html');
  try
    Response.Content := strRead.ReadToEnd;
  finally
    strRead.Free;
  end;
end;

procedure TWebModule2.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ObjectsRestServer_Classes.TObjectsRest;
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule2;

end.




