unit cMotorista;

interface

uses Firedac.Comp.Client, Firedac.DApt, System.SysUtils, Vcl.Graphics;

Type
   TMotorista = class
   private
      FConn: TFDConnection;
      FMOTORISTA_ID: Integer;
      FCPF: String;
      FNOME: String;
      FCIDADE: String;
   public

      constructor Create(conn: TFDConnection);

      property MOTORISTA_ID: Integer read FMOTORISTA_ID write FMOTORISTA_ID;
      property NOME: String read FNOME write FNOME;
      property CIDADE: String read FCIDADE write FCIDADE;
      property CPF: String read FCPF write FCPF;

      function Inserir(out erro: String; out cod: Integer): Boolean;
      function ListarMotoristas(out erro: String): TFDQuery;

   end;

implementation

{ TMotorista }

constructor TMotorista.Create(conn: TFDConnection);
begin
   FConn := conn;
end;

function TMotorista.Inserir(out erro: String; out cod: Integer): Boolean;
var
   qry: TFDQuery;
begin

   if NOME = '' then
   begin
      erro := 'Informe o nome do Motorista';
      Result := False;
      Exit;
   end;

   try
      try
         qry := TFDQuery.Create(nil);
         qry.Connection := FConn;

         with qry do
         begin
            Active := False;
            SQL.Clear;
            SQL.Add('INSERT INTO MOTORISTA (NOME, CIDADE, CPF) ');
            SQL.Add('VALUES (:NOME, :CIDADE, :CPF)            ');
            ParamByName('NOME').AsString := NOME;
            ParamByName('CIDADE').AsString := CIDADE;
            ParamByName('CPF').AsString := CPF;
            ExecSQL;
         end;

         with qry do
         begin
            Active := False;
            SQL.Clear;
            SQL.Add('SELECT COALESCE(MAX(MOTORISTAID), 0) AS MAIORCODIGO FROM MOTORISTA ');
            Active := True;
         end;

         cod := qry.FieldByName('MAIORCODIGO').AsInteger;

         Result := True;
         erro := '';

      except
         on E: exception do
         begin
            Result := False;
            erro := 'Erro ao inserir motorista: ' + E.Message;
            cod := 0;
         end;
      end;
   finally
      qry.DisposeOf;
   end;
end;

function TMotorista.ListarMotoristas(out erro: String): TFDQuery;
var
   qry: TFDQuery;
begin
   try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConn;

      with qry do
      begin
         Active := False;
         SQL.Clear;
         SQL.Add('SELECT * FROM MOTORISTA ORDER BY NOME');
         Active := True;
      end;
      Result := qry;
      erro := ''
   except
      on E: exception do
      begin
         Result := nil;
         erro := 'Erro ao Listar os Motoristas: ' + E.Message;
      end;
   end;
end;

end.
