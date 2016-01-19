unit DSnapFilter64;

interface

uses
  DBXTransport, SysUtils, IdCoderMIME;

type
  TMimeFilter = class (TTransportFilter)
  public
    function ProcessInput(const Data: TBytes): TBytes; override;
    function ProcessOutput(const Data: TBytes): TBytes; override;
    function Id: string; override;
  end;

implementation

{ TMimeFilter }

function TMimeFilter.Id: string;
begin
  Result := 'Cantools.MimeFilter';
end;

function TMimeFilter.ProcessInput(const Data: TBytes): TBytes;
var
  strEncoded: string;
begin
  strEncoded := TIdEncoderMIME.EncodeBytes(Data);
  Result := BytesOf(strEncoded);
end;

function TMimeFilter.ProcessOutput(const Data: TBytes): TBytes;
var
  strEncoded: string;
begin
  strEncoded := StringOf (Data);
  Result := TIdDecoderMIME.DecodeBytes(strEncoded);
end;

initialization
  TTransportFilterFactory.RegisterFilter(TMimeFilter);

finalization
  TTransportFilterFactory.UnregisterFilter(TMimeFilter);


end.
