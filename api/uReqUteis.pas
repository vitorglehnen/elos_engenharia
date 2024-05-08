unit uReqUteis;

interface

uses
  IdHTTP,
  System.JSON;

function RetornaInformacoesCep(aCep : String): TJSONObject;
function RemoveAcentos(const Value: string): string;

implementation

function RetornaInformacoesCep(aCep : String): TJSONObject;
var vResponseText : string;
    IdHTTP: TIdHTTP;
begin
  IdHTTP := TIdHTTP.Create(nil);

  vResponseText := IdHTTP.Get('http://viacep.com.br/ws/'+ aCep +'/json/');

  Result := TJSONObject.ParseJSONValue(vResponseText) as TJSONObject;
end;

function RemoveAcentos(const Value: string): string;
const
  DiacriticChars: array[0..31, 0..1] of Char = (
    ('�', 'A'), ('�', 'A'), ('�', 'A'), ('�', 'A'), ('�', 'A'), ('�', 'A'), ('�', 'A'), ('�', 'C'),
    ('�', 'E'), ('�', 'E'), ('�', 'E'), ('�', 'E'), ('�', 'I'), ('�', 'I'), ('�', 'I'), ('�', 'I'),
    ('�', 'a'), ('�', 'a'), ('�', 'a'), ('�', 'a'), ('�', 'a'), ('�', 'a'), ('�', 'a'), ('�', 'c'),
    ('�', 'e'), ('�', 'e'), ('�', 'e'), ('�', 'e'), ('�', 'i'), ('�', 'i'), ('�', 'i'), ('�', 'i')
  );
var
  i, j: Integer;
begin
  Result := Value;
  for i := 1 to Length(Result) do
    for j := Low(DiacriticChars) to High(DiacriticChars) do
      if Result[i] = DiacriticChars[j, 0] then
      begin
        Result[i] := DiacriticChars[j, 1];
        Break;
      end;
end;

end.
