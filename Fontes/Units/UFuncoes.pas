unit UFuncoes;

interface

function Criptografia(Senha, Chave: String): String;
function MD5(const Value: String): String;

implementation

uses
   Windows, Messages, Dialogs, SysUtils, StrUtils, IdHashMessageDigest;

function Criptografia(Senha, Chave: String): String;
var
   x, y: Integer;
   NovaSenha: String;
begin
   for x := 1 to Length(Chave) do
   begin
      NovaSenha := '';

      for y := 1 to Length(Senha) do
      begin
         NovaSenha := NovaSenha + Chr((Ord(Chave[x]) xor Ord(Senha[y])));
      end;

      Senha := NovaSenha;
   end;

   Result := Senha;
end;

function MD5(const Value: String): String;
var
   xMD5: TIdHashMessageDigest5;
begin
   xMD5 := TIdHashMessageDigest5.Create;

   try
      Result := LowerCase(xMD5.HashStringAsHex(Value));
   finally
      xMD5.Free;
   end;
end;

end.
