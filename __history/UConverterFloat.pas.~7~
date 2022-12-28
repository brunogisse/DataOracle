unit UConverterFloat;

interface

  function TextToCurr( Texto : string ) : Currency;
  function FormatarMoeda(valor: string): string;


implementation

uses
 Windows, Messages, Dialogs, SysUtils, StrUtils;

 function TextToCurr( Texto : string ) : Currency;
  var nI : Integer;
      TextoLimpo : String;
      begin
         TextoLimpo := '';
         for nI := 1 to Length(Texto) do
           begin
             if Texto[nI] in ['0'..'9',','] then
             TextoLimpo := TextoLimpo + Texto[nI];
           end;
        Result := StrToFloat(TextoLimpo);
      end;


function FormatarMoeda(valor: string): string;
var
  decimais, centena: string;
  i: Integer;
begin
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not(valor[i] in ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 2);
  centena := copy(RightStr(valor, 5), 1, 3);

  case Length(valor) of
    1:
      Result := '0,0' + valor;
    2:
      Result := '0,' + valor;
  else
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais;
  end;
end;

end.
