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
    ('À', 'A'), ('Á', 'A'), ('Â', 'A'), ('Ã', 'A'), ('Ä', 'A'), ('Å', 'A'), ('Æ', 'A'), ('Ç', 'C'),
    ('È', 'E'), ('É', 'E'), ('Ê', 'E'), ('Ë', 'E'), ('Ì', 'I'), ('Í', 'I'), ('Î', 'I'), ('Ï', 'I'),
    ('à', 'a'), ('á', 'a'), ('â', 'a'), ('ã', 'a'), ('ä', 'a'), ('å', 'a'), ('æ', 'a'), ('ç', 'c'),
    ('è', 'e'), ('é', 'e'), ('ê', 'e'), ('ë', 'e'), ('ì', 'i'), ('í', 'i'), ('î', 'i'), ('ï', 'i')
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
