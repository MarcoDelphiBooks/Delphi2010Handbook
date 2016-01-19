unit First3TierHttp_ServerMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSCommonServer, DSServer, DSTCPServerTransport, StdCtrls,
  DSHTTPCommon, DSHTTP;

type
  TFormFirst3Tier2009Server = class(TForm)
    DSServer1: TDSServer;
    DSServerClass1: TDSServerClass;
    Memo1: TMemo;
    DSHTTPService1: TDSHTTPService;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormFirst3Tier2009Server: TFormFirst3Tier2009Server;

implementation

uses
  First3TierHttp_ServerModule;

{$R *.dfm}

procedure TFormFirst3Tier2009Server.DSServer1Connect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  Log (TimeToStr (Now) + ': DSServer1Connect');
end;

procedure TFormFirst3Tier2009Server.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  Log (TimeToStr (Now) + ': DSServer1Disconnect');
end;

procedure TFormFirst3Tier2009Server.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  Log (TimeToStr (Now) + ': DSServerClass1GetClass called');
  PersistentClass := TDSFirst3TierServerModule;
end;

procedure TFormFirst3Tier2009Server.FormCreate(Sender: TObject);
begin
  DSHTTPService1.Active := True;
end;

procedure TFormFirst3Tier2009Server.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
